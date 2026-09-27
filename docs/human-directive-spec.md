# `.human` — Especificación de diseño

**Estado: especificación documentada, no implementada en producción.**

`.human` es una capa declarativa utilizada por HormigasAIS para representar
información asociada a la participación y voluntad humana dentro de un
sistema distribuido.

Su función principal es establecer un punto explícito de referencia entre
una acción del sistema y la voluntad humana que autoriza, configura o
supervisa dicha acción.

## Principios

`.human` NO es:

- una prueba de identidad civil;
- un mecanismo de vigilancia;
- un sistema para inferir intenciones humanas;
- una autoridad autónoma sobre una persona;
- un sustituto de autenticación, autorización o firma criptográfica.

`.human` representa contexto y voluntad declarada.

## Flujo conceptual

```
HUMANO
   │
   │ voluntad / configuración explícita
   ▼
.human
   │
   │ contexto verificable
   ▼
XOXO / LBH
   │
   │ validación de reglas
   ▼
AGENTE / NODO EDGE
   │
   ▼
ACCIÓN
```
