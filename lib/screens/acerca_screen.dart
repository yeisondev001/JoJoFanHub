import 'package:flutter/material.dart';
import '../data/app_data.dart';

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/poster.webp',
              width: double.infinity,
              height: 320,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withAlpha(150),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  appTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  part,
                  style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  year,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Descripción
          Text(
            aboutDescription,
            style: TextStyle(color: Colors.grey[300], height: 1.7, fontSize: 15),
          ),
          const SizedBox(height: 28),

          // Stats
          Row(
            children: [
              Expanded(child: _StatCard(value: '$seasons', label: 'Temporadas')),
              const SizedBox(width: 12),
              Expanded(child: _StatCard(value: '$episodes', label: 'Episodios')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _StatCard(value: network, label: 'Canal')),
              const SizedBox(width: 12),
              Expanded(child: _StatCard(value: year.split(' - ')[0], label: 'Año inicio')),
            ],
          ),
          const SizedBox(height: 28),

          // Detalles
          _InfoCard(
            title: 'Información general',
            children: [
              _InfoRow(icon: Icons.person, label: 'Creador', value: creator),
              _InfoRow(icon: Icons.tv, label: 'Red', value: network),
              _InfoRow(icon: Icons.calendar_today, label: 'Años', value: year),
              _InfoRow(icon: Icons.video_library, label: 'Temporadas', value: '$seasons'),
              _InfoRow(icon: Icons.movie, label: 'Episodios', value: '$episodes'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          SizedBox(
            width: 110,
            child: Text(label, style: TextStyle(color: Colors.grey[500])),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
