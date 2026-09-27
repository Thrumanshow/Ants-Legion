Ants-Legion — Vinculación documental

Ants-Legion es un repositorio de vinculación entre la entrevista
fundacional de HormigasAIS y la evolución documentada de sus conceptos
técnicos.

La entrevista constituye la fuente narrativa de origen.

Este directorio no reproduce la entrevista completa. Su función es
establecer relaciones explícitas entre sus 14 preguntas y los conceptos,
documentos y desarrollos relacionados dentro del ecosistema HormigasAIS.

Modelo de vinculación

ENTREVISTA CODERLEGION
        │
        │ 14 preguntas / respuestas
        ▼
ORIGEN NARRATIVO
        │
        ▼
CONCEPTO
        │
        ▼
DOCUMENTO RELACIONADO
        │
        ▼
IMPLEMENTACIÓN
        │
        ▼
EVIDENCIA

No todas las preguntas implican una implementación existente.

Una relación puede representar únicamente el origen o la evolución
documental de un concepto.

Principio de trazabilidad

La vinculación distingue entre:

lo expresado en la entrevista;
la interpretación o formalización posterior del concepto;
los documentos que lo describen;
las implementaciones que puedan existir posteriormente;
la evidencia que permita verificar una implementación.

Ants-Legion no considera una idea documentada como una implementación
validada.

Estructura

linkage/
├── README.md
└── interview-14q.md

interview-14q.md contiene la matriz de relación entre las 14 preguntas
de la entrevista y los conceptos o artefactos relacionados.

Punto de partida

La vinculación comienza especialmente con .human, concepto que aparece
en la narrativa de HormigasAIS como parte de la integración del factor
humano y la gobernanza dentro del sistema.

Su formalización documental se encuentra en:

docs/human-directive-spec.md

Regla de evolución

idea
  ↓
concepto
  ↓
especificación
  ↓
implementación
  ↓
prueba
  ↓
evidencia

Cada etapa debe conservar su propia naturaleza y no presentarse como una
etapa posterior cuando todavía no existe.
