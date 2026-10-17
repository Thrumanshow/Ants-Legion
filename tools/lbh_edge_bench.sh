#!/usr/bin/env bash
set -Eeuo pipefail

# Banco de pruebas local para mensajes LBH/M2M pequeños.
# IMPORTANTE: por defecto mide el arnés de transporte/simulación, no un SDK LBH real.
# Puede ejecutarse en Linux o Termux.

PAYLOAD_BYTES="${PAYLOAD_BYTES:-16}"
ITERATIONS="${ITERATIONS:-1000}"
DROP_PCT="${DROP_PCT:-10}"
CORRUPT_PCT="${CORRUPT_PCT:-2}"
DUPLICATE_PCT="${DUPLICATE_PCT:-2}"
REORDER_PCT="${REORDER_PCT:-2}"
RETRIES="${RETRIES:-3}"
SEED="${SEED:-20261016}"

usage() {
  cat <<'EOF'
Uso:
  ./lbh_edge_bench.sh integrity   Verifica hash/HMAC de una carga útil.
  ./lbh_edge_bench.sh benchmark   Mide latencia y throughput del arnés local.
  ./lbh_edge_bench.sh resilience  Simula pérdida, corrupción, duplicados y reordenamiento.
  ./lbh_edge_bench.sh all          Ejecuta las tres pruebas.

Variables configurables:
  PAYLOAD_BYTES=16 ITERATIONS=1000 DROP_PCT=10 CORRUPT_PCT=2 \
  DUPLICATE_PCT=2 REORDER_PCT=2 RETRIES=3 SEED=20261016

Ejemplo Termux:
  pkg install coreutils openssl awk
  chmod +x lbh_edge_bench.sh
  PAYLOAD_BYTES=16 ITERATIONS=5000 ./lbh_edge_bench.sh all
EOF
}

require_cmd() { command -v "$1" >/dev/null 2>&1 || { echo "Falta comando: $1" >&2; exit 1; }; }
require_cmd awk
require_cmd sha256sum
require_cmd openssl

(( PAYLOAD_BYTES > 0 )) || { echo "PAYLOAD_BYTES debe ser > 0" >&2; exit 1; }
(( ITERATIONS > 0 )) || { echo "ITERATIONS debe ser > 0" >&2; exit 1; }

# Genera exactamente PAYLOAD_BYTES bytes ASCII, evitando ambigüedad de locale.
make_payload() {
  LC_ALL=C printf '%*s' "$PAYLOAD_BYTES" '' | tr ' ' 'A'
}

payload="$(make_payload)"
secret="hormigasais-bench-secret"

now_ns() {
  if date +%s%N >/dev/null 2>&1; then date +%s%N; else date +%s000000000; fi
}

hmac_payload() {
  # La salida hexadecimal ocupa más bytes que la carga; solo se usa como etiqueta de integridad.
  LC_ALL=C printf '%s' "$1" | openssl dgst -sha256 -hmac "$secret" -binary | od -An -tx1 | tr -d ' \n'
}

sha_payload() {
  LC_ALL=C printf '%s' "$1" | sha256sum | awk '{print $1}'
}

integrity() {
  echo "== integrity =="
  echo "payload_bytes=$PAYLOAD_BYTES"
  echo "sha256=$(sha_payload "$payload")"
  echo "hmac_sha256=$(hmac_payload "$payload")"
  local altered="${payload:0:PAYLOAD_BYTES-1}B"
  [[ "$(sha_payload "$payload")" != "$(sha_payload "$altered")" ]] \
    || { echo "FAIL: una alteración no cambió el hash"; return 1; }
  echo "alteration_detection=PASS"
  echo "scope=integridad de bytes; no demuestra verdad, seguridad del agente ni autoría del registro"
}

benchmark() {
  echo "== benchmark =="
  echo "payload_bytes=$PAYLOAD_BYTES iterations=$ITERATIONS"
  local start end elapsed_ns i digest
  start="$(now_ns)"
  for ((i=1; i<=ITERATIONS; i++)); do
    digest="$(hmac_payload "$payload")"
    [[ -n "$digest" ]] || return 1
  done
  end="$(now_ns)"
  elapsed_ns=$((end-start))
  (( elapsed_ns > 0 )) || elapsed_ns=1
  awk -v n="$ITERATIONS" -v ns="$elapsed_ns" 'BEGIN {
    printf "elapsed_ms=%.3f\n", ns/1000000;
    printf "mean_us=%.3f\n", ns/n/1000;
    printf "messages_per_sec=%.2f\n", n/(ns/1000000000);
  }'
  echo "warning=incluye coste de procesos openssl/printf; sustituir hmac_payload por el SDK real para una medición de protocolo"
}

resilience() {
  echo "== resilience =="
  echo "payload_bytes=$PAYLOAD_BYTES iterations=$ITERATIONS drop_pct=$DROP_PCT corrupt_pct=$CORRUPT_PCT duplicate_pct=$DUPLICATE_PCT reorder_pct=$REORDER_PCT retries=$RETRIES seed=$SEED"
  local delivered=0 lost=0 corrupted=0 duplicates=0 reordered=0 retries_used=0 failed=0
  local i r attempt accepted
  # PRNG determinista: facilita repetir exactamente el escenario.
  for ((i=1; i<=ITERATIONS; i++)); do
    accepted=0
    for ((attempt=0; attempt<=RETRIES; attempt++)); do
      r=$(( (SEED + i*1103515245 + attempt*12345) % 100 ))
      (( r < 0 )) && r=$((-r))
      if (( r < DROP_PCT )); then
        ((lost+=1))
        continue
      fi
      r=$(( (SEED + i*1664525 + attempt*1013904223) % 100 ))
      (( r < 0 )) && r=$((-r))
      if (( r < CORRUPT_PCT )); then
        ((corrupted+=1))
        continue
      fi
      accepted=1
      (( attempt > 0 )) && ((retries_used+=attempt))
      break
    done
    if (( accepted == 1 )); then
      ((delivered+=1))
    else
      ((failed+=1))
    fi
    r=$(( (SEED + i*22695477) % 100 )); (( r < 0 )) && r=$((-r))
    (( r < DUPLICATE_PCT )) && ((duplicates+=1))
    r=$(( (SEED + i*214013) % 100 )); (( r < 0 )) && r=$((-r))
    (( r < REORDER_PCT )) && ((reordered+=1))
  done
  awk -v n="$ITERATIONS" -v d="$delivered" -v f="$failed" -v l="$lost" -v c="$corrupted" -v dup="$duplicates" -v reo="$reordered" -v rt="$retries_used" 'BEGIN {
    printf "delivered=%d\nfailed_after_retries=%d\nloss_events=%d\ncorruption_events=%d\nduplicate_events=%d\nreorder_events=%d\nretry_attempts=%d\ndelivery_rate_pct=%.2f\n", d, f, l, c, dup, reo, rt, 100*d/n;
  }'
  echo "scope=simulación determinista; no reemplaza pruebas de radio, batería, suspensión Android ni red real"
}

mode="${1:-all}"
case "$mode" in
  integrity) integrity ;;
  benchmark) benchmark ;;
  resilience) resilience ;;
  all) integrity; benchmark; resilience ;;
  -h|--help|help) usage ;;
  *) echo "Modo desconocido: $mode" >&2; usage >&2; exit 2 ;;
esac
