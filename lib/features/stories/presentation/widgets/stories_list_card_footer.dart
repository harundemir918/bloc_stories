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
          color: const Color(0xFFF1F2F6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          author.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7F8C8D),
            letterSpacing: 0.5,
          ),
        ),
      ),
      const SizedBox(width: 12),
      // Okuma süresi yerine tarih
      const Icon(Icons.access_time_rounded, size: 14, color: Colors.grey),
      const SizedBox(width: 4),
      Text(
        _formatDate(createdAt),
        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
      ),
    ],
  );

  // Gün/Ay/Yıl formatında basit tarih gösterimi
  String _formatDate(DateTime date) => "${date.day}/${date.month}/${date.year}";
}
