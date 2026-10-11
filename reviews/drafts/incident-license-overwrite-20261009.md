# Incidente: sobrescritura de LICENSE en hormigasais-site

> Informe generado por WikiLab. No es una auditoría independiente ni certifica la veracidad de las afirmaciones.

**Estado:** borrador — pendiente de revisión humana (CLHQ)

## Cronología (verificable en git log de hormigasais-site)
- `5c893ba` 2026-08-24 — Apache-2.0 añadido (decisión deliberada, copyright ligado a Zenodo 2025)
- `637e050` 2026-10-09 — LICENSE sobrescrito con CC BY 4.0 (primer evento)
- `3f467f5` 2026-10-09 — sobrescrito nuevamente con texto completo CC BY 4.0
- `e389afb` 2026-10-09 — restauración verificada de LICENSE y README (stat quirúrgico: 2 archivos, 204+/403−)

## Causa probable
Comandos/agent del fix de licencias de lbh-spec ejecutados contra el directorio del sitio.

## Impacto
Ninguno persistente: estado final verificado (GitHub reporta Apache-2.0). Riesgo latente: operaciones de licenciamiento sin validación de directorio destino.

## Hallazgo adicional (post-análisis)
`package.json` del sitio declaraba `"license": "MIT"` mientras el LICENSE raíz es Apache-2.0 (residuo de scaffold, anterior al incidente). Segundo caso de deriva de metadatos de licencia en el ecosistema (el primero: PKG-INFO/BSL del adapter).

## Lección consolidada
Los metadatos de licencia (PKG-INFO, package.json, frontmatter) divergen silenciosamente del LICENSE raíz. La auditoría debe comparar los tres, no solo leer el LICENSE.

## Acción correctiva propuesta
1. Toda operación sobre archivos LICENSE/README debe verificar `git remote get-url origin` antes de commitear.
2. La auditoría periódica (tools/audit.py) debe comparar LICENSE raíz vs package.json/setup.py/frontmatter.
