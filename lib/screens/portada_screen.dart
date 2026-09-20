import 'package:flutter/material.dart';
import '../data/app_data.dart';

class PortadaScreen extends StatelessWidget {
  final void Function(int)? onTabChange;
  const PortadaScreen({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Título y frase icónica
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF12122A), Color(0xFF0D0D1A)],
              ),
            ),
            child: Column(
              children: [
                Text(
                  appTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  part,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white54,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD4AF37).withAlpha(80)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '"¡El latido de un caballero nunca miente!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFD4AF37),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Grid de accesos directos
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Explorar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 14),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                  children: [
                    _HubCard(
                      emoji: '👥',
                      label: 'Personajes',
                      subtitle: '${characters.length} personajes',
                      color: const Color(0xFFD4AF37),
                      onTap: () => onTabChange?.call(1),
                    ),
                    _HubCard(
                      emoji: '📸',
                      label: 'Momentos',
                      subtitle: '${moments.length} momentos épicos',
                      color: const Color(0xFFFF4500),
                      onTap: () => onTabChange?.call(2),
                    ),
                    _HubCard(
                      emoji: '⚔️',
                      label: 'Jugar',
                      subtitle: 'Pelea contra Dio',
                      color: const Color(0xFF6A0DAD),
                      onTap: () => onTabChange?.call(4),
                    ),
                    _HubCard(
                      emoji: 'ℹ️',
                      label: 'Acerca de',
                      subtitle: '$seasons temporada · $episodes eps',
                      color: const Color(0xFF00BCD4),
                      onTap: () => onTabChange?.call(3),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Preview de personajes
                const Text(
                  'Personajes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: characters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, i) {
                      final c = characters[i];
                      return Column(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFD4AF37), width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                c.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: Colors.grey[800],
                                  child: const Icon(Icons.person, color: Colors.white30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 72,
                            child: Text(
                              c.name.split(' ').first,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 11, color: Colors.white70),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Preview momentos
                const Text(
                  'Momentos épicos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: moments.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, i) {
                      final m = moments[i];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.asset(
                              m.imageUrl,
                              width: 180,
                              height: 130,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 180,
                                height: 130,
                                color: Colors.grey[800],
                              ),
                            ),
                            Container(
                              width: 180,
                              height: 130,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black.withAlpha(200)],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              right: 8,
                              child: Text(
                                m.title,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  final String emoji;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _HubCard({
    required this.emoji,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withAlpha(80), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 36)),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white38, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
