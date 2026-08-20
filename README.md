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
enlaces tipo `zoommtg://` o `spotify://`. Eso requiere que Windows "sepa" de esos protocolos,
lo cual solo puede hacerse localmente, en cada ordenador, una vez.

**Instalador de 1 clic:** descarga [`install.bat`](install.bat) y ejecútalo. Clona los 3 repos
en `%USERPROFILE%\MyEcosystem` (o la carpeta que le digas) e instala los protocolos solo.
Necesita `git` — si no lo tienes, lo instala él mismo con `winget`.

**Manual / avanzado**, si prefieres controlar las rutas tú:

1. Clona `My_ecosystem`, `Life_manager` y `Radar_ingestion` en la misma carpeta padre.
2. Ejecuta `setup\register-launchers.bat` (doble clic), o con rutas explícitas:
   `register-launchers.bat "C:\ruta\Life_manager" "C:\ruta\Radar_ingestion"`

La primera vez que uses un botón, el navegador pedirá confirmar "Abrir la app" — dale a Permitir
(y opcionalmente "recordar mi elección" para que no vuelva a preguntar).

## Actualizarla

Edita `index.html` y haz push a `main`. El deploy tarda ~1 minuto.
