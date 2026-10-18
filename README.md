<!-- Author: Ing. Cristhiam Leonardo Hernández Quiñonez (CLHQ) -->
# Ants-Legion 🐜

🇪🇸 Español | 🇬🇧 [English below](#english)

Ants-Legion es el repositorio de vinculación, trazabilidad y evolución documental del ecosistema HormigasAIS.

Su propósito es conectar la narrativa fundacional de HormigasAIS con las especificaciones técnicas, artefactos de software y evidencias verificables del sistema.

## Estructura del Repositorio

- `docs/`: Especificaciones de diseño y directivas técnicas (ej. `.human`).
- `interview/`: Registro narrativo e histórico de origen (entrevista fundacional de 14 preguntas). Original en español; traducción al inglés derivada. Etapa: **concepto** (narrativa de origen; la etapa de cada afirmación se detalla en `linkage/`).
- `linkage/`: Matriz de trazabilidad y modelo de vinculación entre la narrativa y las implementaciones reales.
- `evidence/`: Muestras públicas del registro de sellos de hormigasais.com (captura, badge y activo sellado, con sus hashes) y corridas del banco de pruebas en `evidence/benchmarks/`. Etapa de las corridas: **prueba**, con arnés simulado; no miden el protocolo LBH real.
- `tools/`: Scripts del banco de pruebas (recolección del entorno, arnés LBH/M2M y empaquetado de evidencia). Etapa: **prueba**, con arnés simulado.
- `reviews/`: Revisiones y borradores de gobernanza.

## Regla de Evolución

El ecosistema sigue un principio estricto de trazabilidad para evitar la sobre-afirmación técnica:

`idea -> concepto -> especificación -> implementación -> prueba -> evidencia`

Cada documento o artefacto dentro de este repositorio refleja explícitamente la etapa en la que se encuentra. La entrevista de `interview/` es narrativa de origen y está en etapa **concepto**: sus afirmaciones no constituyen evidencia técnica por sí solas.

## Idioma

El español es el original canónico. Las versiones en inglés son traducciones derivadas; ante cualquier diferencia, prevalece el original.

## Licencia y Gobernanza

Desarrollado bajo los principios de soberanía digital, computación de borde y participación humana inmersa (`.human`).

Documentación y evidencia de este repositorio: [CC BY 4.0](./LICENSE).

## Recursos públicos relacionados

- [Historia fundacional en CoderLegion](https://coderlegion.com/29780/building-a-sovereign-ai-colony-from-smartphone-cristhiam-hernandezs-developer-journey)
- [Especificación LBH](https://github.com/Thrumanshow/Lenguaje-Binario-HormigasAIS-)
- [SDK Python en PyPI](https://pypi.org/project/lbh-sdk/)
- [SDK JavaScript/Node.js en npm](https://www.npmjs.com/package/lbh-sdk-hormigasais)
- [Publicación Zenodo — DOI 10.5281/zenodo.17767205](https://doi.org/10.5281/zenodo.17767205)
- [Publicación Zenodo — DOI 10.5281/zenodo.19177759](https://doi.org/10.5281/zenodo.19177759)
- [Evidencia experimental](./evidence/benchmarks/)
- [Licenciamiento y gobernanza](./docs/)

---

## English

Ants-Legion is the linkage, traceability, and documentation-evolution repository of the HormigasAIS ecosystem.

Its purpose is to connect HormigasAIS's founding narrative with the system's technical specifications, software artifacts, and verifiable evidence.

### Repository Structure

- `docs/`: Design specifications and technical directives (e.g. `.human`).
- `interview/`: Narrative and historical record of origin (the 14-question founding interview). Spanish original; English translation derived from it. Stage: **concept** (origin narrative; the stage of each claim is detailed in `linkage/`).
- `linkage/`: Traceability matrix and linkage model between the narrative and the actual implementations.
- `evidence/`: Public samples of the seal registry at hormigasais.com (screenshot, badge and sealed asset, with their hashes) and benchmark runs under `evidence/benchmarks/`. Stage of the runs: **test**, with a simulated harness; they do not measure the real LBH protocol.
- `tools/`: Benchmark scripts (environment collection, LBH/M2M harness and evidence packaging). Stage: **test**, with a simulated harness.
- `reviews/`: Governance reviews and drafts.

### Evolution Rule

The ecosystem follows a strict traceability principle to avoid technical over-claiming:

`idea -> concept -> specification -> implementation -> test -> evidence`

Every document or artifact in this repository explicitly states the stage it is at. The interview in `interview/` is origin narrative and is at the **concept** stage: its claims are not technical evidence on their own.

### Language

Spanish is the canonical original. English versions are derived translations; if they differ, the original prevails.

### License and Governance

Developed under the principles of digital sovereignty, edge computing, and immersed human participation (`.human`).

Documentation and evidence in this repository: [CC BY 4.0](./LICENSE).

## Public Resources

- [Founding story on CoderLegion](https://coderlegion.com/29780/building-a-sovereign-ai-colony-from-smartphone-cristhiam-hernandezs-developer-journey)
- [LBH specification](https://github.com/Thrumanshow/Lenguaje-Binario-HormigasAIS-)
- [Python SDK on PyPI](https://pypi.org/project/lbh-sdk/)
- [JavaScript/Node.js SDK on npm](https://www.npmjs.com/package/lbh-sdk-hormigasais)
- [Zenodo publication — DOI 10.5281/zenodo.17767205](https://doi.org/10.5281/zenodo.17767205)
- [Zenodo publication — DOI 10.5281/zenodo.19177759](https://doi.org/10.5281/zenodo.19177759)
- [Experimental evidence](./evidence/benchmarks/)
- [Licensing and governance](./docs/)

