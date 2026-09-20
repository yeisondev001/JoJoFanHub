import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'data/app_data.dart';
import 'screens/portada_screen.dart';
import 'screens/personajes_screen.dart';
import 'screens/momentos_screen.dart';
import 'screens/acerca_screen.dart';
import 'screens/juego_screen.dart';
import 'screens/contratame_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          secondary: Color(0xFF6A0DAD),
          surface: Color(0xFF0D0D1A),
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D1A),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF12122A),
          elevation: 0,
          centerTitle: true,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFF12122A),
          indicatorColor: const Color(0xFFD4AF37).withAlpha(60),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4AF37),
            foregroundColor: Colors.black,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFD4AF37),
            side: const BorderSide(color: Color(0xFFD4AF37)),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int _contratameKey = 0;
  double _volume = 0.5;
  bool _volumeDialogOpen = false;
  late final YoutubePlayerController _openingCtrl;

  final _labels = ['Portada', 'Personajes', 'Momentos', 'Acerca de', 'Jugar', 'Contrátame'];
  final _navLabels = ['Inicio', 'Elenco', 'Momentos', 'Info', 'Jugar', 'Contacto'];
  final _icons = [
    Icons.home,
    Icons.people,
    Icons.photo_library,
    Icons.info,
    Icons.sports_esports,
    Icons.work,
  ];

  List<Widget> get _screens => [
    PortadaScreen(onTabChange: (i) => setState(() => _currentIndex = i)),
    const PersonajesScreen(),
    MomentosScreen(
      onOpeningPause: () => _openingCtrl.pauseVideo(),
      onOpeningResume: () => _openingCtrl.playVideo(),
    ),
    const AcercaScreen(),
    const JuegoScreen(),
    ContratameScreen(key: ValueKey(_contratameKey)),
  ];

  @override
  void initState() {
    super.initState();
    _openingCtrl = YoutubePlayerController.fromVideoId(
      videoId: '1ZKAQzGYYSo',
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        showControls: false,
        strictRelatedVideos: true,
        loop: true,
        mute: true,
      ),
    );
    _openingCtrl.listen((event) {
      if (event.playerState == PlayerState.playing) {
        _openingCtrl.unMute();
        _openingCtrl.setVolume(50);
      }
    });
  }

  @override
  void dispose() {
    _openingCtrl.close();
    super.dispose();
  }

  void _onVolumeChanged(double value) {
    setState(() => _volume = value);
    if (value == 0) {
      _openingCtrl.mute();
    } else {
      _openingCtrl.unMute();
      _openingCtrl.setVolume((value * 100).round());
    }
  }

  IconData get _volumeIcon {
    if (_volume == 0) return Icons.volume_off;
    if (_volume < 0.5) return Icons.volume_down;
    return Icons.volume_up;
  }

  void _showVolumeDialog() {
    setState(() => _volumeDialogOpen = true);
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => Stack(
          children: [
            // toca fuera para cerrar
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
                setState(() => _volumeDialogOpen = false);
              },
              child: Container(color: Colors.transparent),
            ),
            Positioned(
              top: kToolbarHeight + MediaQuery.of(ctx).padding.top,
              right: 8,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 230,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E3A),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFD4AF37).withAlpha(80)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(180),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(_volumeIcon, color: const Color(0xFFD4AF37), size: 20),
                          Text(
                            '${(_volume * 100).round()}%',
                            style: const TextStyle(
                              color: Color(0xFFD4AF37),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SliderTheme(
                        data: SliderTheme.of(ctx).copyWith(
                          trackHeight: 5,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                          activeTrackColor: const Color(0xFFD4AF37),
                          inactiveTrackColor: Colors.grey[700],
                          thumbColor: const Color(0xFFD4AF37),
                          overlayColor: const Color(0xFFD4AF37).withAlpha(40),
                        ),
                        child: Slider(
                          value: _volume,
                          min: 0,
                          max: 1,
                          divisions: 20,
                          onChanged: (v) {
                            setDialogState(() {});
                            _onVolumeChanged(v);
                          },
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.volume_off, size: 14, color: Colors.white38),
                          Icon(Icons.volume_up, size: 14, color: Colors.white38),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToTab(int index) {
    if (index < 0 || index >= _labels.length) return;
    if (index == 5) _contratameKey++;
    setState(() => _currentIndex = index);
    _openingCtrl.playVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _labels[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _showVolumeDialog,
            icon: Icon(
              _volumeIcon,
              color: _volume == 0 ? Colors.grey : const Color(0xFFD4AF37),
            ),
            tooltip: 'Volumen',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity == null) return;
          if (details.primaryVelocity! < -300) {
            // swipe izquierda → siguiente tab
            _goToTab(_currentIndex + 1);
          } else if (details.primaryVelocity! > 300) {
            // swipe derecha → tab anterior
            _goToTab(_currentIndex - 1);
          }
        },
        child: Column(
          children: [
            // Opening — visible solo en portada y cuando el volumen está cerrado
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: _currentIndex == 0 && !_volumeDialogOpen ? 220 : 1,
                child: YoutubePlayer(
                  controller: _openingCtrl,
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: _screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 62,
        color: const Color(0xFF2A0A5E),
        buttonBackgroundColor: const Color(0xFFD4AF37),
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: _icons.map((icon) => Icon(icon, size: 26, color: Colors.white)).toList(),
        onTap: _goToTab,
      ),
    );
  }
}

