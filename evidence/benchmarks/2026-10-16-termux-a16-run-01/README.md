# Evidencia experimental: 2026-10-16-termux-a16-run-01

- **Estado:** ensayo local, no producción.
- **Alcance:** harness-local
- **Payload:** 16 bytes.
- **Iteraciones:** 1000
- **Semilla:** 20261016
- **Script:** tools/lbh_edge_bench.sh
- **SHA-256 del script:** 036cc21b68759ecd28a33b75b088421641561c65406badf655934b5414c6718e

## Interpretación

Esta corrida conserva resultados crudos de integridad, rendimiento y resiliencia. El resultado solo respalda el alcance declarado (harness-local). No demuestra por sí solo verdad del contenido, seguridad integral del agente, rendimiento LBH en red real ni operación de hormigasais.com.

La carga útil de 16 bytes no equivale al tamaño completo del frame ni del agente. Para un ensayo SDK/e2e deben añadirse tamaños de encabezado, identidad, secuencia y autenticación.

## Gobernanza

Este paquete no incluye secretos, no llama servicios externos y no se promociona automáticamente a producción. Requiere revisión humana antes de incorporarse a Ants-Legion.
