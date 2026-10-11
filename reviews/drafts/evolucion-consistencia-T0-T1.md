# Evolución de consistencia y licenciamiento — T0 → T1

> Derivado del registro T0 (2026-10-08/10, evidencia en evidence/) y del ciclo de gobernanza 2026-10-11. Informe de WikiLab — pendiente de revisión humana (CLHQ).

## 1. Línea base T0 (transcript 2026-10-08/10)
Auditoría Python de 5 nodos con criterio de strings (buscar CLHQ / CC-BY-4.0 / Source-Available en *.md y LICENSE*): reportó 4/5 "✅ VERIFICADA". El criterio verificaba presencia de texto, no estado legal real: no consultaba API, no comparaba metadatos, no distinguía org destino. Ants-Legion fue el único veredicto honesto (⚠️ sin firma en raíz — corregido en 5bfb5f0).

Puntos ciegos de T0 registrados en el mismo transcript:
- HormigasAIS.github.io (hormigasais.com): sin licencia.
- HormigasAIS-AirCity: 404 vía Thrumanshow (está en HormigasAIS) y sin LICENSE local.
- `licenseInfo.spdx_id` devuelve null → columna "sin-licencia" falsa universal.

## 2. Evolución T0 → T1 (todo commit-verificable)
| Nodo | T0 | T1 | Evidencia |
|---|---|---|---|
| lbh-spec | fix SPDX sin tag | NOASSERTION correcto + tag v1.0.1 | 25f661f, tag 5f2b4ba |
| xoxo-lbh-adapter | remoto duplicado, BSL untracked | Source-Available v1.0 | df21a99, 33d85e8 |
| hormigasais-site | incidente: LICENSE 2x sobrescrito y restaurado | Apache-2.0 alineado (LICENSE, package.json, enlace) | 637e050, 3f467f5, e389afb, f5d4c19, 2d28af2, 2f02248 |
| Ants-Legion | sin firma en raíz | CC-BY-4.0 + firma CLHQ | 5bfb5f0, a9d5f78, 091dd0c |
| HormigasAIS-AirCity | sin LICENSE local | Source-Available v1.0 | b808651, f70d792 |
| HormigasAIS.github.io | sin licencia | Apache-2.0 + 0 vulnerabilidades | e490c2b, 5b6d885, 3a7194d |

## 3. Configuraciones metodológicas: T0 → T1
| Práctica | T0 | T1 |
|---|---|---|
| Verificación | strings en archivos | API de GitHub + commits + tags |
| Auditoría de licencias | solo LICENSE raíz | LICENSE vs package.json vs frontmatter (liccheck-site.sh) |
| Operación sobre repos | comandos sueltos, rm -rf tras comentario | dry-run que consulta gh (archive-batch.sh v2) |
| Referencias remotas | tag sin pull (falló) | fetch → pull --ff-only → verificar → tag → push → verificar |

## 4. Lección consolidada
T0 sobrestimaba su propio veredicto; T1 no afirma nada sin commit, tag o salida de API. La evolución cambió el método más que el estado: el mismo ecosistema, medido con instrumentos que ya no mienten por omisión.

## 5. Pendientes heredados del transcript
- Repos privados (61): el listado T0 ya muestra basura de nombres en privados (android-intrusive-apps-watchdog., Algo-, XOXO-, .humano-) — ciclo propio.
- CV con datos personales en 2 repos públicos (hormigasais-site, hormigasais-githubio) — decisión consciente de CLHQ.
Estado: borrador — pendiente de revisión humana (CLHQ).
