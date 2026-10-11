#!/data/data/com.termux/files/usr/bin/bash
# Diagnóstico de licenciamiento — hormigasais-site (SOLO LECTURA, no modifica nada)
set -u
SITE="$HOME/hormigasais-site"

echo "=== 1. ¿Qué dice el LICENSE en raíz? ==="
head -5 "$SITE/LICENSE" 2>/dev/null || echo "❌ No existe LICENSE"

echo ""
echo "=== 2. Commit que AÑADIÓ el LICENSE ==="
git -C "$SITE" log --diff-filter=A --format="%h | %ad | %an | %s" --date=short -- LICENSE

echo ""
echo "=== 3. ¿Ese commit fue el PRIMER commit del repo? ==="
FIRST=$(git -C "$SITE" rev-list --max-parents=0 HEAD | head -1)
ADD=$(git -C "$SITE" log --diff-filter=A --format="%h" -- LICENSE | tail -1)
echo "Primer commit:  $FIRST — $(git -C "$SITE" log -1 --format='%ad | %s' --date=short $FIRST)"
if [ "$ADD" = "$FIRST" ]; then
  echo "→ ⚠️  LICENSE llegó en el PRIMER commit = probablemente vino con el scaffold (decisión no tomada por ti)"
else
  echo "→ ✅ LICENSE se añadió DESPUÉS del primer commit = elección explícita posterior"
fi

echo ""
echo "=== 4. ¿El LICENSE cambió alguna vez? ==="
git -C "$SITE" log --format="%h | %ad | %s" --date=short -- LICENSE

echo ""
echo "=== 5. Lo que GitHub reporta ahora ==="
gh api repos/Thrumanshow/hormigasais-site --jq '"visibilidad: " + .visibility + " | licencia: " + (.license.spdx_id // "sin-licencia")'

echo ""
echo "=== 6. Menciones de licencia dentro del sitio (excluye submódulo y .git) ==="
grep -rniE "apache|licen[cs]e" "$SITE" --include="*.md" --include="*.html" --include="*.json" --include="*.toml" --include="*.yml" -l 2>/dev/null | grep -v "/.git/" | grep -v "lbh-spec" | head -10

echo ""
echo "=== 7. ¿Qué framework es? (identifica si es scaffold de plantilla) ==="
ls "$SITE" | grep -v "^\.git$" | head -15
for f in package.json _config.yml pyproject.toml; do
  [ -f "$SITE/$f" ] && echo "--- $f:" && head -8 "$SITE/$f"
done
