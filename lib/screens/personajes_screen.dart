import 'package:flutter/material.dart';
import '../data/app_data.dart';
import 'personaje_detalle_screen.dart';

class PersonajesScreen extends StatelessWidget {
  const PersonajesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PersonajeDetalleScreen(character: character),
            ),
          ),
          child: Hero(
            tag: 'character_${character.name}',
            child: Material(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagen de fondo
                  Image.asset(
                    character.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[800],
                      child: const Icon(Icons.person, size: 60, color: Colors.white30),
                    ),
                  ),
                  // Gradiente inferior para legibilidad
                  Positioned(
                    bottom: 0, left: 0, right: 0,
                    child: Container(
                      height: 90,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                  // Nombre y rol sobre la imagen
                  Positioned(
                    bottom: 10, left: 10, right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          character.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            shadows: [
                              Shadow(offset: Offset(-1, -1), blurRadius: 4, color: Colors.black),
                              Shadow(offset: Offset(1, -1), blurRadius: 4, color: Colors.black),
                              Shadow(offset: Offset(-1,  1), blurRadius: 4, color: Colors.black),
                              Shadow(offset: Offset(1,  1), blurRadius: 4, color: Colors.black),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4AF37).withAlpha(220),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            character.role,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

