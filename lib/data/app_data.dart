import '../models/character.dart';
import '../models/moment.dart';

// ─── JOJO'S BIZARRE ADVENTURE - PHANTOM BLOOD ───

const String appTitle = "JoJo's Bizarre Adventure";
const String appSubtitle = 'Phantom Blood — La sangre de los Joestar';
const String aboutDescription =
    'Phantom Blood es la primera parte de la legendaria saga JoJo\'s Bizarre Adventure, '
    'creada por Hirohiko Araki. Ambientada en la Inglaterra victoriana de 1880, sigue a '
    'Jonathan Joestar, un joven noble cuya vida cambia para siempre cuando Dio Brando '
    'entra en su hogar. Una historia de rivalidad, honor, vampiros y el poder del Hamon.';
const String creator = 'Hirohiko Araki / David Production';
const int seasons = 1;
const int episodes = 9;
const String year = '2012';
const String network = 'Tokyo MX';
const String part = 'Parte 1 — Phantom Blood';

// Slider — imágenes de portada (assets locales)
final List<String> sliderImages = [
  'assets/images/poster.webp',
  'assets/images/jonathan.png',
  'assets/images/dio.webp',
];

// Personajes
final List<Character> characters = [
  Character(
    name: 'Jonathan Joestar',
    role: 'Protagonista',
    actor: 'Kazuyuki Okitsu (JP) / Johnny Yong Bosch (EN)',
    description:
        'El primer JoJo. Jonathan es un caballero inglés de corazón noble y puro. '
        'Criado en una mansión aristocrática, desarrolla el poder del Hamon (Overdrive) '
        'para combatir a los vampiros. Su gentileza y determinación lo convierten en '
        'uno de los personajes más queridos del manga shonen.',
    imageUrl: 'assets/images/jonathan.png',
  ),
  Character(
    name: 'Dio Brando',
    role: 'Antagonista',
    actor: 'Takehito Koyasu (JP) / Patrick Seitz (EN)',
    description:
        'El villano más icónico del anime. Hijo de un ladrón, adoptado por la familia '
        'Joestar, Dio esconde una ambición sin límites. Usa la Máscara de Piedra para '
        'convertirse en vampiro y alcanzar la inmortalidad. '
        '"MUDA MUDA MUDA!" — La amenaza que marcó generaciones.',
    imageUrl: 'assets/images/dio.webp',
  ),
  Character(
    name: 'Will A. Zeppeli',
    role: 'Aliado / Maestro',
    actor: 'Takashi Inagaki (JP) / Richard Epcar (EN)',
    description:
        'Un maestro italiano del Hamon que viaja al mundo buscando la Máscara de Piedra. '
        'Se convierte en mentor y compañero de Jonathan, enseñándole técnicas avanzadas '
        'del Hamon. Su sacrificio en la batalla es uno de los momentos más emotivos de '
        'Phantom Blood.',
    imageUrl: 'assets/images/zeppeli.webp',
  ),
  Character(
    name: 'Robert E. O. Speedwagon',
    role: 'Aliado',
    actor: 'Hikaru Midorikawa (JP) / Keith Silverstein (EN)',
    description:
        'Originalmente un ladrón de Ogre Street, Speedwagon queda impresionado por la '
        'nobleza de Jonathan y se une a su causa. Conocido por su sombrero con cuchillas '
        'y por narrar dramáticamente las batallas. Fundador de la Fundación Speedwagon, '
        'pilar de toda la saga.',
    imageUrl: 'assets/images/speedwagon.png',
  ),
];

// Momentos favoritos
final List<Moment> moments = [
  Moment(
    title: 'Dio aplasta el perro Danny',
    season: 'Episodio 1 — Dio el Invasor',
    description:
        'En uno de los momentos más impactantes de la historia del anime, Dio Brando '
        'demuestra su verdadera naturaleza al quemar vivo al perro favorito de Jonathan. '
        'Este acto brutal establece a Dio como uno de los villanos más odiados y al mismo '
        'tiempo más fascinantes del anime. El momento que define toda la rivalidad.',
    imageUrl: 'assets/images/dio.webp',
    videoUrl: 'https://www.youtube.com/watch?v=kd98CZiXFtY',
  ),
  Moment(
    title: 'Jonathan domina el Hamon',
    season: 'Episodio 4 — El Entrenamiento de Zeppeli',
    description:
        'Tras semanas de entrenamiento brutal con el maestro Zeppeli, Jonathan finalmente '
        'domina el poder del Hamon (Energía Solar). La escena donde realiza el "Overdrive" '
        'por primera vez es un momento épico de superación personal. '
        '"¡El corazón latiente de un caballero no miente!"',
    imageUrl: 'assets/images/momento2.jpg',
    videoUrl: 'https://www.youtube.com/watch?v=aGcloYtUrh4',
  ),
  Moment(
    title: 'La batalla final en el barco',
    season: 'Episodio 9 — El fin de los Joestar',
    description:
        'El enfrentamiento definitivo entre Jonathan y Dio en un barco en llamas. '
        'Jonathan, mortalmente herido, usa sus últimas fuerzas para detener a Dio. '
        'En sus brazos moribundos sostiene a su esposa Erina, en una de las escenas '
        'más emotivas y trágicas del anime. El sacrificio de un verdadero caballero.',
    imageUrl: 'assets/images/momento3.webp',
    videoUrl: 'https://www.youtube.com/watch?v=b6EUw11iUAI',
  ),
];

// Trivia — Phantom Blood
final List<Map<String, dynamic>> quizQuestions = [
  {
    'question': '¿En qué país y época está ambientado Phantom Blood?',
    'options': ['Francia, siglo XVII', 'Italia, 1900', 'Inglaterra, 1880', 'Japón, 1800'],
    'answer': 2,
  },
  {
    'question': '¿Cómo se llama el poder de combate que usa Jonathan Joestar?',
    'options': ['Stand', 'Hamon', 'Spin', 'Nen'],
    'answer': 1,
  },
  {
    'question': '¿Qué objeto convierte a Dio en vampiro?',
    'options': ['El anillo de los Joestar', 'La Máscara de Piedra', 'El Orbe Rojo', 'El Medallón Brando'],
    'answer': 1,
  },
  {
    'question': '¿Cuántos episodios tiene la primera temporada de JoJo (Phantom Blood)?',
    'options': ['12', '13', '9', '26'],
    'answer': 2,
  },
  {
    'question': '¿Quién le enseñó el Hamon a Jonathan?',
    'options': ['Speedwagon', 'Straizo', 'Will A. Zeppeli', 'George Joestar'],
    'answer': 2,
  },
  {
    'question': '¿Qué grita Dio cuando usa sus ataques más fuertes?',
    'options': ['ORA ORA ORA', 'MUDA MUDA MUDA', 'WRYYY', 'DORA DORA DORA'],
    'answer': 2,
  },
  {
    'question': '¿Cómo se llama la esposa de Jonathan Joestar?',
    'options': ['Lisa Lisa', 'Erina Pendleton', 'Suzie Q', 'Holly Kujo'],
    'answer': 1,
  },
];

// Datos de contacto
const String myName = 'Yeison Rojas';
const String myMatricula = '20241822';
const String myEmail = 'yeisonrojas03@gmail.com';
const String myPhone = '+1 829 801 9374';
const String myRole = 'Desarrollador Móvil';
const String myDescription =
    'Estudiante de desarrollo de aplicaciones móviles y fan de JoJo\'s Bizarre Adventure. '
    'Apasionado por crear experiencias digitales únicas con Flutter.';
const String myPhotoUrl = ''; // usa asset local
const String myPhotoAsset = 'assets/images/yeison.jpeg';
const String myGithub = 'https://github.com/yeisondev001';
const String myLinkedin = 'https://www.linkedin.com/in/yeison-rojas-henriquez';
