import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/app_data.dart';

class ContratameScreen extends StatefulWidget {
  const ContratameScreen({super.key});

  @override
  State<ContratameScreen> createState() => _ContratameScreenState();
}

class _ContratameScreenState extends State<ContratameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  // Foto: zoom con elasticOut
  late Animation<double> _photoScale;
  // Anillo dorado: escala y opacidad
  late Animation<double> _ringScale;
  late Animation<double> _ringOpacity;
  // Header (nombre, rol, desc): fade + slide
  late Animation<double> _headerFade;
  late Animation<Offset> _headerSlide;
  // Tarjetas: fade + slide escalonado
  late List<Animation<double>> _cardFade;
  late List<Animation<Offset>> _cardSlide;
  // Botón
  late Animation<double> _btnFade;
  late Animation<Offset> _btnSlide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

    Animation<double> _interval(double start, double end, {Curve curve = Curves.easeOut}) =>
        CurvedAnimation(parent: _ctrl, curve: Interval(start, end, curve: curve));

    _photoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      _interval(0.0, 0.4, curve: Curves.elasticOut),
    );

    _ringScale = Tween<double>(begin: 1.0, end: 1.6).animate(
      _interval(0.05, 0.45),
    );
    _ringOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.7), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 0.0), weight: 70),
    ]).animate(_interval(0.05, 0.45));

    _headerFade = Tween<double>(begin: 0.0, end: 1.0).animate(_interval(0.3, 0.55));
    _headerSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(_interval(0.3, 0.55));

    const cardStarts = [0.45, 0.55, 0.65, 0.75];
    const cardEnds   = [0.62, 0.72, 0.82, 0.92];
    _cardFade = List.generate(4, (i) =>
      Tween<double>(begin: 0.0, end: 1.0).animate(_interval(cardStarts[i], cardEnds[i])));
    _cardSlide = List.generate(4, (i) =>
      Tween<Offset>(begin: const Offset(-0.4, 0), end: Offset.zero)
          .animate(_interval(cardStarts[i], cardEnds[i])));

    _btnFade = Tween<double>(begin: 0.0, end: 1.0).animate(_interval(0.85, 1.0));
    _btnSlide = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(_interval(0.85, 1.0));

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 16),

          // Foto con zoom + anillo de onda dorada
          AnimatedBuilder(
            animation: _ctrl,
            builder: (context, _) {
              return SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Anillo pulsante
                    Transform.scale(
                      scale: _ringScale.value,
                      child: Opacity(
                        opacity: _ringOpacity.value,
                        child: Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFD4AF37),
                              width: 2.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Foto con zoom
                    Transform.scale(
                      scale: _photoScale.value,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFD4AF37), width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD4AF37).withAlpha(80),
                              blurRadius: 20,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            myPhotoAsset,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          // Nombre, rol y descripción con fade + slide
          FadeTransition(
            opacity: _headerFade,
            child: SlideTransition(
              position: _headerSlide,
              child: Column(
                children: [
                  Text(
                    myName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      myRole,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    myDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[400], fontSize: 15, height: 1.6),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Matrícula
          FadeTransition(
            opacity: _headerFade,
            child: SlideTransition(
              position: _headerSlide,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37).withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD4AF37).withAlpha(80)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.school, color: Color(0xFFD4AF37), size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'Matrícula: $myMatricula',
                      style: const TextStyle(
                        color: Color(0xFFD4AF37),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tarjetas en cascada desde la izquierda
          _AnimatedCard(
            fade: _cardFade[0],
            slide: _cardSlide[0],
            child: _ContactCard(
              iconWidget: const Icon(Icons.email, color: Color(0xFFD4AF37)),
              bgColor: const Color(0xFFD4AF37).withAlpha(30),
              title: 'Correo electrónico',
              value: myEmail,
              onTap: () => _launchUrl('mailto:$myEmail'),
            ),
          ),
          const SizedBox(height: 12),
          _AnimatedCard(
            fade: _cardFade[1],
            slide: _cardSlide[1],
            child: _ContactCard(
              iconWidget: const FaIcon(FontAwesomeIcons.whatsapp, color: Color(0xFF25D366)),
              bgColor: const Color(0xFF25D366).withAlpha(30),
              title: 'WhatsApp',
              value: myPhone,
              onTap: () => _launchUrl(
                'https://wa.me/${myPhone.replaceAll(RegExp(r'[^0-9]'), '')}?text=Hola, vi tu app y quiero contactarte',
              ),
            ),
          ),
          const SizedBox(height: 12),
          _AnimatedCard(
            fade: _cardFade[2],
            slide: _cardSlide[2],
            child: _ContactCard(
              iconWidget: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
              bgColor: Colors.white.withAlpha(20),
              title: 'GitHub',
              value: 'github.com/yeisondev001',
              onTap: () => _launchUrl(myGithub),
            ),
          ),
          const SizedBox(height: 12),
          _AnimatedCard(
            fade: _cardFade[3],
            slide: _cardSlide[3],
            child: _ContactCard(
              iconWidget: const FaIcon(FontAwesomeIcons.linkedin, color: Color(0xFF0A66C2)),
              bgColor: const Color(0xFF0A66C2).withAlpha(30),
              title: 'LinkedIn',
              value: 'Yeison Rojas Henriquez',
              onTap: () => _launchUrl(myLinkedin),
            ),
          ),

          const SizedBox(height: 28),

          // Botón de acción con fade + slide desde abajo
          FadeTransition(
            opacity: _btnFade,
            child: SlideTransition(
              position: _btnSlide,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _launchUrl(
                    'https://wa.me/${myPhone.replaceAll(RegExp(r'[^0-9]'), '')}?text=Hola, vi tu app y quiero contactarte',
                  ),
                  icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
                  label: const Text('WhatsApp', style: TextStyle(fontSize: 16)),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedCard extends StatelessWidget {
  final Animation<double> fade;
  final Animation<Offset> slide;
  final Widget child;

  const _AnimatedCard({required this.fade, required this.slide, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final Widget iconWidget;
  final Color bgColor;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactCard({
    required this.iconWidget,
    required this.bgColor,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: iconWidget),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}
