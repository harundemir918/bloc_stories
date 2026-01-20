import 'package:flutter/material.dart';

/// Hikaye kartının alt kısmındaki tarih ve aksiyon ikonunu gösteren bileşen.
class StoriesListCardFooter extends StatelessWidget {
  final DateTime createdAt;
  final String author;

  const StoriesListCardFooter({
    required this.createdAt,
    required this.author,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      // Kategori etiketi yerine yazar ismi (etiket şeklinde)
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          author.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodySmall?.color,
            letterSpacing: 0.5,
          ),
        ),
      ),
      const SizedBox(width: 12),
      // Okuma süresi yerine tarih
      Icon(
        Icons.access_time_rounded,
        size: 14,
        color: Theme.of(context).textTheme.bodySmall?.color,
      ),
      const SizedBox(width: 4),
      Text(
        _formatDate(createdAt),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  // Gün/Ay/Yıl formatında basit tarih gösterimi
  String _formatDate(DateTime date) => "${date.day}/${date.month}/${date.year}";
}
