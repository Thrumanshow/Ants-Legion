# Reviews — Revisiones documentales

Este directorio conserva revisiones documentales generadas por HormigasAIS WikiLab.

## drafts/

Contiene informes pendientes de revisión o aprobación humana.

Estos informes:

- no son auditorías independientes;
- no certifican la veracidad de las afirmaciones;
- no representan necesariamente contenido publicado;
- pueden contener acciones pendientes.

## approved/

Debe contener únicamente informes revisados y aprobados manualmente.

## Flujo documental

```text
borrador
  -> WikiLab
  -> alertas semánticas
  -> revisión humana
  -> trazabilidad
  -> reviews/drafts/
  -> aprobación manual
  -> reviews/approved/
```

## Relación con Ants-Legion

Las revisiones pueden referenciar:

- linkage/interview-14q.md
- docs/
- evidence/
- commits específicos
- versiones de repositorios externos

Una referencia documental no demuestra por sí sola que una implementación funcione.
La matriz debe distinguir entre idea, concepto, especificación, implementación, prueba y evidencia.

## Revisión previa a publicación

Los informes de artículos aún no publicados deben identificarse como:

- prepublication_review
- draft_review
- pending_human_approval

No deben describirse como auditorías de un artículo publicado.
