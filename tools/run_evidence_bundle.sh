#!/usr/bin/env bash
set -Eeuo pipefail

bench=""
out_root="evidence/benchmarks"
label=""
scope="harness-local"
iterations="1000"
payload_bytes="16"
seed="20261016"

usage() {
  cat <<'EOF'
Uso:
  run_evidence_bundle.sh --bench SCRIPT --label LABEL [opciones]

Opciones:
  --out DIR             raíz de salida (default: evidence/benchmarks)
  --scope SCOPE         harness-local|sdk-local|e2e-local|network-controlled
  --iterations N        iteraciones (default: 1000)
  --payload-bytes N     carga útil (default: 16)
  --seed N              semilla (default: 20261016)
EOF
}

while (($#)); do
  case "$1" in
    --bench) bench="$2"; shift 2 ;;
    --out) out_root="$2"; shift 2 ;;
    --label) label="$2"; shift 2 ;;
    --scope) scope="$2"; shift 2 ;;
    --iterations) iterations="$2"; shift 2 ;;
    --payload-bytes) payload_bytes="$2"; shift 2 ;;
    --seed) seed="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Opción desconocida: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -n "$bench" && -f "$bench" ]] || { echo "--bench debe apuntar a un script local" >&2; exit 2; }
[[ -n "$label" ]] || { echo "--label es obligatorio" >&2; exit 2; }
[[ "$scope" != production ]] || { echo "scope=production está prohibido en este arnés" >&2; exit 2; }
[[ "$scope" =~ ^(harness-local|sdk-local|e2e-local|network-controlled)$ ]] || { echo "scope inválido" >&2; exit 2; }
[[ "$iterations" =~ ^[1-9][0-9]*$ && "$payload_bytes" =~ ^[1-9][0-9]*$ ]] || { echo "iterations y payload-bytes deben ser positivos" >&2; exit 2; }

root="$out_root/$label"
mkdir -p "$root"
script_hash="$(sha256sum "$bench" | awk '{print $1}')"

cat > "$root/config.txt" <<EOF
experiment_label=$label
scope=$scope
payload_bytes=$payload_bytes
iterations=$iterations
seed=$seed
bench_script=$bench
bench_script_sha256=$script_hash
production_contact=none
network_contact=none
secret_capture=disabled
EOF

"$(dirname "$0")/collect_environment.sh" "$root/environment.txt"

run_one() {
  local mode="$1" file="$2"
  PAYLOAD_BYTES="$payload_bytes" ITERATIONS="$iterations" SEED="$seed" \
    DROP_PCT="${DROP_PCT:-10}" CORRUPT_PCT="${CORRUPT_PCT:-2}" \
    DUPLICATE_PCT="${DUPLICATE_PCT:-2}" REORDER_PCT="${REORDER_PCT:-2}" \
    RETRIES="${RETRIES:-3}" bash "$bench" "$mode" > "$root/$file" 2>&1
}

run_one integrity integrity.txt
run_one benchmark benchmark.txt
run_one resilience resilience.txt

cat > "$root/README.md" <<EOF
# Evidencia experimental: $label

- **Estado:** ensayo local, no producción.
- **Alcance:** $scope
- **Payload:** $payload_bytes bytes.
- **Iteraciones:** $iterations
- **Semilla:** $seed
- **Script:** $bench
- **SHA-256 del script:** $script_hash

## Interpretación

Esta corrida conserva resultados crudos de integridad, rendimiento y resiliencia. El resultado solo respalda el alcance declarado ($scope). No demuestra por sí solo verdad del contenido, seguridad integral del agente, rendimiento LBH en red real ni operación de hormigasais.com.

La carga útil de $payload_bytes bytes no equivale al tamaño completo del frame ni del agente. Para un ensayo SDK/e2e deben añadirse tamaños de encabezado, identidad, secuencia y autenticación.

## Gobernanza

Este paquete no incluye secretos, no llama servicios externos y no se promociona automáticamente a producción. Requiere revisión humana antes de incorporarse a Ants-Legion.
EOF

( cd "$root" && sha256sum README.md config.txt environment.txt integrity.txt benchmark.txt resilience.txt > SHA256SUMS )
echo "evidence_bundle=$root"
cat "$root/SHA256SUMS"
