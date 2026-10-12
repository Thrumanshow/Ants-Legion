# Informe de gobernanza del ecosistema HormigasAIS — Octubre 2026

> Informe generado por WikiLab. No es una auditoría independiente ni certifica la veracidad de las afirmaciones.
> Estado: borrador — pendiente de revisión humana (CLHQ)

## 1. Alcance
Inventario de repos de las organizaciones HormigasAIS y Thrumanshow: 131 repos (70 públicos y 61 privados). Este ciclo de licenciamiento y seguridad (octubre 2026) cubre solo repos públicos; los 7 nodos de la sección 2 son los remediados en este ciclo, no el ecosistema completo.

## 2. Estado final de los 7 nodos remediados (de 70 repos públicos)
| Nodo | Licencia | Commits de referencia |
|---|---|---|
| HormigasAIS/lbh-spec | CC BY 4.0 + MESENTERY (NOASSERTION) | 25f661f, tag v1.0.1 |
| HormigasAIS/xoxo-lbh-adapter | Source-Available v1.0 (NOASSERTION) | df21a99, 33d85e8 |
| HormigasAIS/lbh-node-service | MESENTERY (NOASSERTION) | preexistente (MESENTERY sobre código Go; ver sección 6) |
| HormigasAIS/HormigasAIS.github.io | Apache-2.0 | e490c2b, 5b6d885 |
| HormigasAIS/HormigasAIS-AirCity | Source-Available v1.0 (NOASSERTION) | fe0daa9, b808651 |
| Thrumanshow/hormigasais-site | Apache-2.0 | f5d4c19, 2d28af2, 2f02248 |
| Thrumanshow/Ants-Legion | CC-BY-4.0 | a9d5f78, 091dd0c, 5bfb5f0 |

## 3. Inventario y lotes de triage
- Lote A (4): forks ajenos. Archivados el 2026-10-11 (ver sección 7).
- Lote B (3): basura explícita (nombres con guiones o puntos finales). Archivados el 2026-10-11 (ver sección 7).
- Lote C (21): sin push desde 2025-12 (13 sin licencia y 8 con licencia). Decisión individual pendiente; no se archiva en bloque.
- Lote D (18 al 2026-10-11): sin licencia y activos en 2026; licenciar por tipo (spec/docs: CC BY 4.0; código LBH: Source-Available; sitios: Apache-2.0). Pendiente; site-v2 y CristhiamBarberShop se resuelven antes (ver sección 7).
- Lote E (5): especiales con decisión individual (perfil Thrumanshow, Lenguaje-Binario-HormigasAIS- posiblemente spec antigua, lbh-sdk vs lbh-sdk-js duplicados, site-v2 obsoleto, CristhiamBarberShop personal)

## 4. Incidentes y lecciones del ciclo
4.1 Sobrescritura de LICENSE en hormigasais-site (2026-10-09) — ver incident-license-overwrite-20261009.md
4.2 Tres derivas de metadatos: PKG-INFO/BSL (adapter), package.json MIT (wrapper), package.json MIT (.github.io). Los metadatos divergen silenciosamente del LICENSE raíz.
4.3 Lockfile envejecido: 26 alertas Dependabot (2 critical: @capacitor/android proxy origin bypass; tar DoS) resueltas con bump a 7.6.9 + npm audit fix (commit 3a7194d). Causa: sin auditoría programada de dependencias.
4.4 Escaneo asíncrono no es estado real: el contador de alertas mostró valores intermedios (26→15→0) durante minutos tras el push. La verdad del estado la dio npm audit local (0 vulnerabilidades) — verificar el artefacto, no el eco.

## 5. Prevención estructural propuesta
1. .github/dependabot.yml semanal en repos con lockfiles activos
2. Auditoría de licencias comparando LICENSE raíz vs package.json / setup.py / frontmatter
3. Verificación de `git remote get-url origin` antes de operar sobre LICENSE/README
4. audit.py tomando su lista de repos desde `gh repo list` (no rutas hardcodeadas)

## 6. Pendientes al cierre del borrador
- Archivado lote A+B: ejecutado el 2026-10-11 (7/7 verificado contra la API, ver sección 7). Pendiente: lote C, decisión individual.
- Licenciamiento del lote D
- lbh-node-service: MESENTERY (familia documental) sobre código Go. Decidir si se alinea a Source-Available (decisión de CLHQ pendiente).
- termux-backup del pipeline WikiLab (única copia local de agents/ y tools/)

## 7. Ejecución del archivado A+B (2026-10-11)
Script: archive-batch.sh v2 (gh repo archive --yes; nombres tomados de gh repo list, no tecleados). Nota: ese archivo fue sobrescrito por error el 2026-10-11, después de la ejecución, y ya no existe; se conservan lote-a.txt y lote-b.txt, y la verificación contra la API confirma los 7 archivados.
- Lote A (forks, 4/4): gnu_bash, Gravatar-SDK-Android, Plugin-Java, github-desktop-aur
- Lote B (basura explícita, 3/3): security---checklist-. , spotify-cc-integration. , spotify-README.md.
- Verificación post contra API: 7 archivados en Thrumanshow; 0 antes del ciclo (inventario 2026-10-10); sin vetados (Chris-BarberShop, HormigasAIS-, HormigasAIS-public- fuera por diseño).
- Lote C: 21 candidatos (13 sin licencia inactivos + 8 licenciados inactivos) — decisión individual pendiente.
- Lote D: 18 repos sin licencia y activos en 2026 — licenciamiento por tipo pendiente.
- Inventario real: 131 repos (70 públicos + 61 privados fuera del alcance de este ciclo).
Estado: anexo de WikiLab — pendiente de revisión humana (CLHQ).
Decisiones CLHQ (2026-10-11): CristhiamBarberShop → Lote E (negocio personal); 9 repos MIT ya publicados → se respetan sin normalizar; hormigasais-site-v2 en disputa (mecánica: lote D / triage previo: E por obsoleto) — resolver antes de licenciar.
Hallazgos inventario lote D (2026-10-11): experimental-lbh-verify está VACÍO (API 404) → propuesto archivar, no licenciar; hormigasais-legal contiene duplicado de descarga commiteado ("(1).pdf") — higiene futura; flags MESENTERY en FASES/Institucionalidad/legal (decisión CLHQ antes o después del CC BY).
