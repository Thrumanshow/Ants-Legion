# Matriz de Vinculación — Entrevista CoderLegion vs. Ecosistema HormigasAIS

Esta matriz vincula de forma explícita las 14 preguntas/respuestas de la entrevista fundacional con los conceptos, especificaciones y artefactos del ecosistema HormigasAIS.

Las etapas siguen la Regla de Evolución: `idea -> concepto -> especificación -> implementación -> prueba -> evidencia`. Que una afirmación tenga una especificación no implica que esté implementada ni probada. Lo que está fuera de este repositorio no se verifica desde aquí.

| # | Pregunta / Tema | Concepto Clave | Documento de Referencia | Etapa | Notas / Verificación |
|---|---|---|---|---|---|
| 01 | Introducción y Trayectoria | De Automatización Centralizada a Redes Biológicas | interview/entrevista_coderlegion_hormigasais_corregida.txt | Concepto | Narrativa de origen. |
| 02 | Origen de HormigasAIS | Feromonas Digitales y Capa .human | docs/human-directive-spec.md | Especificación | La especificación se declara no implementada en producción. Afirmación sobre la investigación de Stanford (síntesis de feromonas): por verificar, falta la cita del estudio. |
| 03 | Definición de Soberanía | Autonomía Operacional Edge y Reglas Locales | — | Concepto | Sin artefacto vinculado. "Garantiza" es una afirmación de diseño, no demostrada. |
| 04 | Desarrollo en Movilidad | Nodos Ligeros (Termux / Agente Mosquito) | — | Concepto | Práctica descrita sin evidencia enlazada. La cita de Tesla está atribuida, sin fuente verificada. |
| 05 | Protocolo LBH | ADN del Agente, Polígono de Tiro y Feromonas | github.com/HormigasAIS/lbh-spec (v1.0.0); DOI 10.5281/zenodo.17767205 (versión por aclarar) | Especificación | "Inmutable" y "escudo de seguridad": afirmaciones no demostradas, sin prueba enlazada. lbh-spec define mensajes en texto plano; el binario compacto se describe en el adaptador xoxo-lbh-adapter. |
| 06 | Diseñado para el Edge | Operación Offline y Reenlace por Feromonas | github.com/HormigasAIS/lbh-spec (v1.0.0); DOI 10.5281/zenodo.17767205 (versión por aclarar) | Especificación | Operación offline y reenlace: sin prueba enlazada. |
| 07 | Agentes de IA y M2M | Coordinación Distribuida y Pragmatismo | — | Idea | Sin artefacto vinculado. |
| 08 | Seguridad y Verificación | Sello HMAC-SHA256 (interno) y registro público de sellos (consulta por ID y comparación de hash SHA-256 en el dispositivo) | evidence/ (captura, badge y archivo sellado de muestra CLHQ-HINN9XSU) | Implementación | El registro lo opera HormigasAIS: verificar por esa vía implica confiar en el registro. No se afirma verificación criptográfica independiente. El sellado no prueba que el contenido sea verdadero. |
| 09 | Código Abierto / Reciprocidad | Construcción Pública y Filosofía "The Colony" | README.md | Concepto | Principio, no artefacto técnico. Las licencias varían: lbh-spec usa CC BY 4.0; xoxo-lbh-adapter usa BSL 1.1 (código visible con restricciones comerciales). |
| 10 | Participante .human | El Humano como Pieza Inmersa en el Protocolo | docs/human-directive-spec.md | Especificación | Misma nota que P02: especificación documentada, no implementada. |
| 11 | Construcción con Restricciones | Estrés de Hardware como Validación de Diseño | — | Concepto | Principio de diseño. |
| 12 | Riesgo y Continuidad | Factor de Bus (Bus Factor) y Respaldo Colectivo | — | Concepto | Respaldos accesibles a otras personas: sin evidencia enlazada. |
| 13 | Visión de Futuro | Data Room KREA y Replicabilidad Institucional | hormigasais-foundation/krea/ | Concepto | Referencia externa, no verificada desde este repositorio. La verificación pública del locker de evidencia sigue en desarrollo. |
| 14 | Mensaje a Desarrolladores | Construcción Iterativa y Origen de .human | interview/entrevista_coderlegion_hormigasais_corregida.txt | Concepto | Narrativa de origen. Las "14 líneas" son notas escritas en una libreta. |

## Versiones del documento

- Original canónico (español): `interview/entrevista_coderlegion_hormigasais_corregida.txt`.
- Versión con vinculaciones: `interview/entrevista_coderlegion_hormigasais_vinculada.txt`.
- Traducción al inglés, derivada del original: `interview/entrevista_coderlegion_hormigasais_corregida.en.txt`. Ante cualquier diferencia, prevalece el original.

## English summary

This matrix maps each of the 14 interview answers to its stage in the evolution rule. Having a specification does not mean a claim is implemented or tested. Claims without linked artifacts remain at the concept or idea stage. The public seal registry (row 08) is an implementation, but it is operated by HormigasAIS, so verifying through it means trusting the registry. The Spanish interview is canonical; the English file is a derived translation.
