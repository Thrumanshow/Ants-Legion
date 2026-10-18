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

## Limitación conocida: resiliencia (añadido el 2026-10-17)

Esta corrida usó la versión 1 del arnés (`tools/lbh_edge_bench.sh`, con el SHA-256 indicado arriba). En esa versión, las pérdidas y la corrupción simuladas salen de una fórmula lineal que se repite cada 20 mensajes: con los parámetros por defecto, ningún mensaje se pierde dos veces seguidas y la corrupción simulada no llega a ocurrir. Por eso `delivery_rate_pct` en `resilience.txt` es consecuencia del simulador y no una medición del protocolo LBH. No debe citarse como evidencia de resiliencia.

La cadena `hormigasais-bench-secret` en el script es una clave de prueba pública, sin valor de seguridad.

Esta corrida se conserva sin cambios como registro histórico. Cualquier corrida con otro azar o con el SDK real irá en una carpeta nueva, con la versión del script indicada.

**English:** this run used harness v1. Its simulated losses follow a linear formula, so the delivery rate in `resilience.txt` is a property of the simulator, not a measurement of LBH, and must not be cited as resilience evidence. `hormigasais-bench-secret` is a public test key with no security value.
