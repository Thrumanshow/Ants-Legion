<!-- wikilab_linkage_created_at_utc: 2026-10-09T06:51:53Z -->

# WikiLab–Ants-Legion: relación arquitectónica y temporal

## 1. Propósito

Este documento define la relación entre HormigasAIS WikiLab, un entorno
local de análisis y generación documental, y Ants-Legion, el repositorio
Git versionado que conserva documentación, especificaciones, referencias
y evidencias relacionadas con HormigasAIS.

Su objetivo es establecer un enlace documental explícito entre ambos
componentes, manteniendo la separación entre procesamiento local,
trazabilidad, revisión humana y publicación.

## 2. Ubicación y límites del sistema

### WikiLab

WikiLab se encuentra actualmente en el entorno local de Termux:

`~/HormigasAIS_WikiLab`

Contiene agentes, herramientas, configuración, informes y archivos de
trabajo utilizados para el análisis semántico y la generación de
trazabilidad.

La existencia de esos componentes no implica por sí sola que todas las
etapas del pipeline hayan sido probadas o validadas.

### Ants-Legion

Ants-Legion se encuentra clonado dentro de WikiLab:

`~/HormigasAIS_WikiLab/Ants-Legion`

Repositorio remoto:

https://github.com/Thrumanshow/Ants-Legion

El repositorio mantiene documentación, matrices de enlace, especificaciones
y evidencias versionables.

WikiLab no se considera un repositorio Git independiente por el mero hecho
de contener esta clonación. La relación documentada aquí no crea un
segundo repositorio ni convierte automáticamente los archivos locales
en contenido publicado.

## 3. Enlace documental

La relación se organiza mediante el siguiente flujo:

`artefacto local -> análisis -> referencias -> revisión humana -> incorporación a Git -> publicación`

Referencias principales:

- `../agents/`: agentes locales de WikiLab, fuera del repositorio Ants-Legion.
- `../tools/`: herramientas locales de WikiLab, fuera del repositorio Ants-Legion.
- `linkage/README.md`: propósito de la matriz de enlaces.
- `linkage/interview-14q.md`: relación entre la entrevista y los artefactos documentados.
- `reviews/README.md`: flujo de revisión documental cuando el directorio está presente.
- `evidence/README.md`: descripción de las evidencias conservadas en Ants-Legion.

Las rutas que comienzan con `../` se interpretan desde el directorio
`linkage/` de la clonación local. No deben confundirse con rutas del
repositorio GitHub.

Un informe generado por WikiLab es un resultado de procesamiento local.
Para considerarlo parte de Ants-Legion debe incorporarse explícitamente
al repositorio y someterse al proceso de revisión correspondiente.
La incorporación a Git no equivale por sí misma a aprobación técnica.

## 4. Contrato temporal

El tiempo se trata como una dimensión de interoperabilidad y trazabilidad,
no como una prueba automática de autenticidad.

### 4.1. Formato canónico

Los registros destinados a correlacionarse entre nodos, procesos o
repositorios deben utilizar marcas de tiempo conscientes de zona horaria,
preferentemente UTC en formato ISO 8601:

`2026-10-09T06:46:41Z`

Los ejemplos son ilustrativos; no representan necesariamente la hora de
creación de un artefacto concreto.

En Python, la forma recomendada para generar una marca temporal UTC es:

`datetime.now(timezone.utc).isoformat()`

Los registros existentes de WikiLab que utilizan esta expresión ya
producen marcas temporales UTC con información de zona horaria.

### 4.2. Hora local y hora UTC

En la inspección del entorno A16 realizada el 9 de octubre de 2026,
Android informó `America/El_Salvador`. La hora observada fue UTC−6.

La hora local puede utilizarse para presentación y operación humana.
Para correlación entre sistemas debe conservarse la zona horaria o
normalizarse la marca temporal a UTC.

No debe suponerse que una abreviatura como `CST`, sin su desplazamiento,
identifica universalmente una zona horaria.

### 4.3. Hora declarada y sincronización

La lectura del reloj del dispositivo y la conversión a UTC demuestran
cómo interpreta el sistema su reloj en el momento de la inspección.
No demuestran que ese reloj esté sincronizado con una fuente externa
confiable.

En la inspección documentada no se encontraron `timedatectl`,
`chronyc` ni `ntpdate` disponibles en el PATH de Termux. Esto no demuestra
que Android carezca de sincronización automática; su estado no quedó
verificado mediante esas comprobaciones.

Por tanto, una marca temporal del sistema debe tratarse como tiempo
declarado por el entorno emisor, salvo que exista evidencia adicional
de sincronización y de la política de confianza aplicada.

### 4.4. Tiempos de evento y duración

Para registros persistentes, auditoría y correlación se utilizarán
marcas temporales de pared con zona horaria explícita.

Para medir duraciones dentro de un proceso —por ejemplo, tiempos de
ejecución, intervalos de espera o vencimientos relativos— se preferirá
un reloj monotónico, como `time.monotonic()` en Python.

El reloj de pared puede corregirse o cambiar; por eso no debe utilizarse
como única base para medir duraciones transcurridas.

### 4.5. Vigencia y vencimientos

Si WikiLab incorpora caducidad de sesiones, TTL, ventanas de revisión
o expiración de autorizaciones, la implementación deberá definir:

- el instante de referencia;
- la zona horaria o el tipo de reloj utilizado;
- la duración o fecha de vencimiento;
- el comportamiento ante cambios o discrepancias del reloj;
- la evidencia necesaria para auditar la decisión.

Este documento no afirma que todas esas funciones estén implementadas.

## 5. Trazabilidad y revisión humana

Cada informe o revisión que se incorpore a Ants-Legion debería conservar,
cuando corresponda:

- identificador del artefacto revisado;
- referencia a su ubicación o versión;
- marca temporal de generación en UTC;
- estado de revisión;
- referencias a evidencia verificable;
- commit asociado, cuando exista.

Los estados de borrador, pendiente de revisión, aprobado y publicado
deben mantenerse diferenciados.

Una referencia documental no demuestra por sí misma que una función
esté implementada. Una marca temporal tampoco demuestra por sí sola
integridad, autoría o veracidad.

## 6. Responsabilidades

WikiLab es responsable de producir resultados locales reproducibles
dentro de las capacidades realmente verificadas.

Ants-Legion conserva los documentos y las referencias que se incorporen
y versionen en su historial Git.

La revisión humana determina si un borrador puede aprobarse según el
proceso aplicable. La publicación requiere una operación explícita de
Git y la correspondiente actualización del remoto.

## 7. Alcance de esta declaración

Este documento establece una relación arquitectónica y temporal entre
WikiLab y Ants-Legion. No certifica que el pipeline completo funcione,
que el reloj esté sincronizado externamente ni que cada afirmación
técnica tenga evidencia suficiente.

Las rutas locales, el estado del repositorio y las capacidades del
entorno pueden cambiar. Deben verificarse al ejecutar cada operación.

## 8. Criterio de evolución

Cualquier cambio futuro en la generación de marcas temporales, la
sincronización, los vencimientos o la publicación de informes debe
preservar la separación entre:

`tiempo del sistema -> registro temporal -> evidencia -> revisión -> publicación`

El objetivo es mantener trazabilidad sin atribuir al reloj, a WikiLab
o al repositorio garantías que no hayan sido verificadas.
