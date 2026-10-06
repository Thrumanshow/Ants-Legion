# evidence/ — Evidencia pública del registro de sellos | Public seal registry evidence

## Español

Muestra del registro público de sellos de hormigasais.com (pestaña "Verificar" y API pública).

- **Sello de muestra:** `CLHQ-HINN9XSU`, creado desde la web con nivel Enterprise. El badge indica vigencia permanente. En el plan Free la firma es válida por un mes; Premium y Enterprise pueden además descargar el badge.
- **Lo que muestra el registro:** propietario `CLHQ`; activo `Logo`; protocolo Lenguaje-Binario-HormigasAIS; nodo emisor A16-SanMiguel-SV; emitido el 14 de mayo de 2026 a las 2:58:33 p. m. (UTC−6), es decir `2026-05-14T20:58:33.724Z`.
- **Archivo sellado:** `logo_soberano_hd.png` (PNG de 2048×1810 px, 257 288 bytes), cuyo SHA-256 coincide con el hash registrado.
- **Captura:** `hormigasais-verificar-CLHQ-HINN9XSU.jpg` (958×1551 px), tomada con Chrome el 2026-10-05 a las 22:41 (UTC−6) en hormigasais.com. Muestra la consulta por ID y la verificación por archivo con el resultado "HMAC válido".
- **Badge:** `badge-lbh-CLHQ-HINN9XSU.png` (400×120 px).

### Cómo comprobarlo

1. Calcula el hash del archivo: `sha256sum logo_soberano_hd.png`.
2. En hormigasais.com, pestaña Verificar, escribe `CLHQ-HINN9XSU` y pulsa Verificar.
3. En "Verificación por archivo", arrastra `logo_soberano_hd.png`. La página indica que el hash SHA-256 se calcula en tu dispositivo y que el archivo no se sube a ningún servidor.
4. Desde una terminal: `curl -s https://api.hormigasais.com/seal/CLHQ-HINN9XSU` y compara el campo `hash` con el resultado del paso 1.

### Alcance y límites

- El registro lo opera HormigasAIS: verificar por esta vía implica confiar en ese registro. No es una verificación criptográfica independiente.
- Que el hash coincida muestra que el registro contiene un sello para ese archivo; propietario, fecha y plan son lo que el registro declara.
- Los campos `hmac_firma` y `hash_valido`, y el resultado "HMAC válido", los calcula el servidor con una clave privada; un tercero no puede reproducirlos.
- Un sello no prueba que el contenido sea verdadero.
- El cálculo local del hash es lo que declara la página; aquí no se audita su código.
- Etapa según la Regla de Evolución: implementación (registro público de sellos).

## English

Sample from the public seal registry at hormigasais.com ("Verificar" tab and public API).

- **Sample seal:** `CLHQ-HINN9XSU`, created from the website at Enterprise level. The badge shows permanent validity. Free-plan signatures are valid for one month; Premium and Enterprise can also download the badge.
- **What the registry shows:** owner `CLHQ`; asset `Logo`; protocol Lenguaje-Binario-HormigasAIS; issuing node A16-SanMiguel-SV; issued on 14 May 2026 at 2:58:33 p.m. (UTC−6), i.e. `2026-05-14T20:58:33.724Z`.
- **Sealed file:** `logo_soberano_hd.png` (2048×1810 px PNG, 257,288 bytes), whose SHA-256 matches the registered hash.
- **Screenshot:** `hormigasais-verificar-CLHQ-HINN9XSU.jpg` (958×1551 px), taken with Chrome on 2026-10-05 at 22:41 (UTC−6) on hormigasais.com. It shows the ID lookup and the file verification with the result "HMAC válido".
- **Badge:** `badge-lbh-CLHQ-HINN9XSU.png` (400×120 px).

### How to check

1. Hash the file: `sha256sum logo_soberano_hd.png`.
2. On hormigasais.com, "Verificar" tab, type `CLHQ-HINN9XSU` and press Verificar.
3. Under "Verificación por archivo", drop `logo_soberano_hd.png`. The page states that the SHA-256 hash is computed on your device and the file is not uploaded.
4. From a terminal: `curl -s https://api.hormigasais.com/seal/CLHQ-HINN9XSU` and compare the `hash` field with the result of step 1.

### Scope and limits

- HormigasAIS operates the registry: verifying this way means trusting that registry. It is not independent cryptographic verification.
- A matching hash shows that the registry holds a seal for that file; owner, date and plan are what the registry declares.
- The `hmac_firma` and `hash_valido` fields, and the "HMAC válido" result, are computed by the server with a private key; a third party cannot reproduce them.
- A seal does not prove the content is true.
- Local hashing is what the page declares; its code is not audited here.
- Stage per the Evolution Rule: implementation (public seal registry).

## Archivos y SHA-256 / Files and SHA-256

| Archivo / File | Bytes | SHA-256 |
|---|---|---|
| `hormigasais-verificar-CLHQ-HINN9XSU.jpg` | 158408 | `d73449f3e87e5947fc57c44e31f7680fe65d0100f3bba98997e3dd8621363f62` |
| `badge-lbh-CLHQ-HINN9XSU.png` | 18402 | `0823ff14b9d9e0492df8a7fd60352d4eaea0f8de07ae0737a07e914dadea9490` |
| `logo_soberano_hd.png` | 257288 | `0e59e4cc9825064789a3fd7f678c2f2417c5b06ea3885cc7778d93cdc52a7640` |
