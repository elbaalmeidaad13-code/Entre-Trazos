# ENTRE TRAZOS ❤️

Primera entrega: PWA visual y funcional en modo local.

## Qué funciona ahora
- Interfaz adaptable a iPhone y navegación entre secciones.
- Dibujo táctil en lienzo: lápiz, rotulador, pincel, goma, línea, círculo, rectángulo y corazón.
- Paleta de colores, grosor y opacidad.
- Deshacer/rehacer y limpiar lienzo.
- Guardado local persistente en el navegador del dispositivo.
- Galería, edición de dibujos guardados y plantillas iniciales.
- Código de pareja de demostración, retos e ideas del mundo.
- Preparación PWA para añadir a pantalla de inicio.

## Importante: sincronización real entre dos iPhone
Esta versión NO sincroniza todavía dibujos entre móviles. Crear un código en el modo local no crea por sí solo un espacio remoto. Para hacer real la conexión privada hacen falta un proyecto backend y credenciales propias. No he simulado esa conexión.

## Publicar e instalar en los dos iPhone
1. Sube el contenido de esta carpeta a un repositorio de GitHub.
2. En GitHub abre Settings → Pages.
3. En “Build and deployment”, selecciona “Deploy from a branch”, rama `main` y carpeta `/root`, y guarda.
4. Espera a que GitHub Pages publique la dirección.
5. En cada iPhone, abre esa dirección con Safari.
6. Pulsa Compartir → Añadir a pantalla de inicio → Añadir.

La PWA debe servirse mediante HTTPS (GitHub Pages lo proporciona). Para actualizaciones, vuelve a publicar los archivos; el navegador descargará la nueva versión.

## Para activar nube y colaboración real
Crear un proyecto Supabase y configurar:
- Autenticación de usuarios.
- Tabla `couples` con código de invitación.
- Tabla `drawings` con `couple_id`, `author_id`, `title`, `document_json`, `preview_path`, `created_at`, `updated_at`.
- Supabase Storage privado para imágenes/archivos.
- Realtime para cambios de dibujos y presencia.
- Row Level Security (RLS) para que solo los dos miembros de una pareja puedan leer/escribir sus dibujos.

Después añade la URL y la anon key pública del proyecto en `config.js`. Nunca pongas una `service_role` key en el frontend.

La sincronización de dibujo en tiempo real, notificaciones push, autenticación y asociación segura por invitación aún necesitan implementación backend; no se deben considerar disponibles en esta entrega.

## Estructura
- `index.html`: interfaz.
- `app.js`: navegación, lienzo, galería y funciones locales.
- `config.js`: configuración futura.
- `manifest.webmanifest`: instalación PWA.
- `sw.js`: caché offline básica.
- `assets/icon.svg`: icono.

## Privacidad y copias
Los dibujos locales se guardan en el almacenamiento del navegador de cada iPhone. Borrar los datos de Safari puede eliminarlos. Exporta o guarda copias de los dibujos importantes. El almacenamiento en nube con copias y control de acceso debe configurarse antes de usarla como espacio compartido permanente.
