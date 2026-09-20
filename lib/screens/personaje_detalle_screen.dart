import 'package:flutter/material.dart';
import '../models/character.dart';

class PersonajeDetalleScreen extends StatelessWidget {
  final Character character;

  const PersonajeDetalleScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(offset: Offset(-1.5, -1.5), blurRadius: 4, color: Colors.black),
                    Shadow(offset: Offset(1.5, -1.5), blurRadius: 4, color: Colors.black),
                    Shadow(offset: Offset(-1.5,  1.5), blurRadius: 4, color: Colors.black),
                    Shadow(offset: Offset(1.5,  1.5), blurRadius: 4, color: Colors.black),
                  ],
                ),
              ),
              background: Hero(
                tag: 'character_${character.name}',
                child: Image.asset(
                  character.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.person, size: 100, color: Colors.white30),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _DetailChip(label: character.role, isPrimary: true),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Descripción',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    character.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[300],
                          height: 1.7,
                        ),
                  ),
                  const SizedBox(height: 24),
                  _InfoRow(label: 'Actor / Actriz', value: character.actor),
                  _InfoRow(label: 'Rol', value: character.role),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final String label;
  final bool isPrimary;

  const _DetailChip({required this.label, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isPrimary
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 14)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

