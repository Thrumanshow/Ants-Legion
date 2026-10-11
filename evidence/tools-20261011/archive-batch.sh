#!/usr/bin/env bash
# archive-batch.sh v2 — archivado por lotes HormigasAIS/Thrumanshow
# Uso:  bash archive-batch.sh           (dry-run: valida contra gh, no archiva)
#       EXEC=1 bash archive-batch.sh    (ejecuta: gh repo archive --yes)
# Listas junto al script: lote-a.txt (forks), lote-b.txt (basura explícita)
# Lineas en blanco y # se ignoran.
DIR="$(cd "$(dirname "$0")" && pwd)"
EXEC_MODE=0; [ "${EXEC:-0}" = "1" ] && EXEC_MODE=1
modo="DRY-RUN (valida contra gh, no archiva)"
[ "$EXEC_MODE" = "1" ] && modo="EJECUCION REAL (gh repo archive --yes)"
carga() { [ -f "$1" ] && grep -vE '^[[:space:]]*(#|$)' "$1" || true; }
A=$(carga "$DIR/lote-a.txt"); B=$(carga "$DIR/lote-b.txt")
na=$(printf '%s\n' "$A" | grep -c .); nb=$(printf '%s\n' "$B" | grep -c .)
echo "== archive-batch.sh v2 — $modo =="
echo "   lote A: $na | lote B: $nb"
if [ "$na" -eq 0 ] && [ "$nb" -eq 0 ]; then
  echo "ERROR: lotes vacios — genera lote-a.txt / lote-b.txt" >&2; exit 1
fi
ok=0; skip=0; warn=0; fail=0
procesa() {
  local lote="$1" repos="$2" repo linea es_fork arch push resto
  for repo in $repos; do
    linea=$(gh repo view "$repo" --json isFork,isArchived,pushedAt \
      --jq '[.isFork,.isArchived,.pushedAt]|map(tostring)|join("|")' 2>/dev/null) || {
      echo "[$lote] X $repo — NO EXISTE o sin acceso (404). No se toca."
      fail=$((fail+1)); continue; }
    es_fork=${linea%%|*}; resto=${linea#*|}; arch=${resto%%|*}; push=${resto#*|}
    if [ "$arch" = "true" ]; then
      echo "[$lote] = $repo — ya archivado (push $push). Omitido."
      skip=$((skip+1)); continue; fi
    if [ "$lote" = "A" ] && [ "$es_fork" = "false" ]; then
      echo "[$lote] ! $repo — en lote A pero isFork=false. Revisar; no se toca."
      warn=$((warn+1)); continue; fi
    if [ "$EXEC_MODE" = "1" ]; then
      if gh repo archive "$repo" --yes >/dev/null 2>&1; then
        echo "[$lote] OK $repo — ARCHIVADO (fork: $es_fork, push $push)"; ok=$((ok+1))
      else
        echo "[$lote] X $repo — fallo gh repo archive (scope/permisos?)"; fail=$((fail+1))
      fi
    else
      echo "[$lote] -> $repo — se archivaria (fork: $es_fork, push $push)"; ok=$((ok+1))
    fi
  done
}
procesa A "$A"
procesa B "$B"
echo "== Resumen: $ok en lote | $skip omitidos | $warn advertencias | $fail fallos =="
[ "$EXEC_MODE" = "0" ] && echo "Dry-run cuadra =>  EXEC=1 bash $0"
