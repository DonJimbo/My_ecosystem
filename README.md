# My Ecosystem

Panel personal, público, que conecta mis dos frentes:

- 🤖 **Agentes** — [`Inventario-agentes`](https://github.com/DonJimbo/Inventario-agentes) (privado). Se lanzan como comandos dentro de Claude Code (`/job-hunter`, etc.).
- 🖥️ **Software** — [`Life_manager`](https://github.com/DonJimbo/Life_manager) y [`Radar_ingestion`](https://github.com/DonJimbo/Radar_ingestion) (privados). Apps que corren en tu PC Windows.

Este repo solo contiene el HTML de la lanzadera (enlaces + descripciones) y el script de
setup. No hay credenciales, datos personales ni nada sensible aquí — por eso es público.

## Ver la página

**https://donjimbo.github.io/My_ecosystem/**

Se publica sola con GitHub Pages en cada push a `main` (ver `.github/workflows/pages.yml`).

## Botones "▶ Abrir app" (1 vez por ordenador)

Los botones de software usan protocolos personalizados (`myeco-recorder://`, `myeco-radar://`)
para lanzar el `.bat` de cada app directamente desde el navegador — el mismo mecanismo que usan
enlaces tipo `zoommtg://` o `spotify://`.

En cada ordenador nuevo:

1. Clona `My_ecosystem`, `Life_manager` y `Radar_ingestion` en la misma carpeta padre.
2. Ejecuta `setup\register-launchers.bat` (doble clic) — registra los protocolos en tu usuario
   de Windows (`HKCU`, sin necesitar admin).
3. Los botones ya funcionan. La primera vez el navegador pedirá confirmar "Abrir la app" — dale
   a Permitir (y opcionalmente "recordar mi elección").

Si tus repos no están en la misma carpeta, pasa las rutas a mano:
`register-launchers.bat "C:\ruta\Life_manager" "C:\ruta\Radar_ingestion"`

## Actualizarla

Edita `index.html` y haz push a `main`. El deploy tarda ~1 minuto.
