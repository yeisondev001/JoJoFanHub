# ⚔️ Phantom Blood Battle

Fan app en **Flutter** de *JoJo's Bizarre Adventure — Phantom Blood* (Parte 1), que reúne en un solo lugar información, multimedia y un minijuego interactivo, todo en español.

<p align="center">
  <img src="assets/images/poster.webp" width="300" alt="Phantom Blood poster">
</p>

## 📱 Qué problema resuelve

La información del anime está dispersa en wikis, videos y foros en inglés. **Phantom Blood Battle** la centraliza en una experiencia móvil en español:

- 🎭 **Elenco completo**: personajes con biografía, rol y actores de doblaje (JP/EN), con transiciones Hero.
- 🎬 **Momentos épicos**: las escenas clave de la historia con su propio reproductor de video (YouTube con fallback a MP4).
- 🎮 **Batalla por turnos**: pelea contra Dio Brando eligiendo entre Jonathan o Zeppeli, con HP, barra de Hamon, críticos, modo vampiro y "Última Voluntad".
- 📺 **Opening interactivo**: el opening del anime integrado en la portada con control de volumen en tiempo real.
- 📇 **Contrátame**: perfil de desarrollador con contacto directo (WhatsApp, GitHub, LinkedIn, email).

## 💻 Stack y tecnologías

| Tecnología | Uso |
|---|---|
| Flutter / Dart | Framework principal (Material 3) |
| `youtube_player_iframe` | Opening y videos de momentos |
| `video_player` + `chewie` | Reproductor MP4 con fallback |
| `url_launcher` | Contacto (WhatsApp, email, redes) |
| `curved_navigation_bar` | Navegación inferior animada |
| `font_awesome_flutter` | Iconos de marca |

## 🏗️ Arquitectura

```
lib/
├── main.dart              # Shell de navegación + opening + control de volumen
├── data/
│   └── app_data.dart      # Contenido: personajes, momentos, datos del anime
├── models/
│   ├── character.dart     # Modelo de personaje
│   └── moment.dart        # Modelo de momento épico
└── screens/
    ├── portada_screen.dart          # Hub de exploración
    ├── personajes_screen.dart       # Grid de personajes
    ├── personaje_detalle_screen.dart# Detalle con SliverAppBar + Hero
    ├── momentos_screen.dart         # Lista de momentos
    ├── momento_detalle_screen.dart  # Detalle + reproductor de video
    ├── acerca_screen.dart           # Info del anime
    ├── juego_screen.dart            # Batalla por turnos contra Dio
    └── contratame_screen.dart       # Perfil de contacto animado
```

## ✨ Características técnicas destacadas

- **Gestión de estado del juego**: máquina de estados de batalla (`choosing → animating → dioTurn → finished`) con fases de intro, selección y resultado.
- **Animaciones**: `AnimationController` con `TweenSequence` para sacudidas, flashes y barras de HP animadas; entrada en cascada con `Interval` en Contrátame.
- **Navegación**: `IndexedStack` que preserva el estado de cada tab + swipe horizontal entre secciones.
- **Resiliencia**: `errorBuilder` en imágenes, detección automática YouTube/MP4 en URLs de video y pantalla de error si el video falla.

## 🚀 Cómo ejecutar

```bash
git clone https://github.com/yeisondev001/PhantomBloodBattle.git
cd PhantomBloodBattle
flutter pub get
flutter run
```

## 🧪 Pruebas

```bash
flutter test
flutter analyze
```

## 📸 Screenshots

| Portada | Batalla | Personajes |
|---|---|---|
| Hub de exploración con opening | RPG por turnos contra Dio | Grid con Hero animations |

## 👤 Autor

**Yeison Rojas Henriquez** — Matrícula 20241822
Desarrollador Móvil · Estudiante de desarrollo de aplicaciones móviles

- GitHub: [@yeisondev001](https://github.com/yeisondev001)
- LinkedIn: [Yeison Rojas Henriquez](https://www.linkedin.com/in/yeison-rojas-henriquez)
- Email: yeisonrojas03@gmail.com

---

*Proyecto académico de la asignatura Introducción al Desarrollo de Aplicaciones Móviles. JoJo's Bizarre Adventure es propiedad de Hirohiko Araki / David Production — proyecto fan sin fines de lucro.*
