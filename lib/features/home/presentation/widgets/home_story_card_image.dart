import 'package:flutter/material.dart';

/// Hikaye kartının üst kısmındaki görsel ve yazar ismini gösteren bileşen.
class HomeStoryCardImage extends StatelessWidget {
  final String imageUrl;
  final String author;

  const HomeStoryCardImage({
    required this.imageUrl,
    required this.author,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      // Hikaye Görseli - İnternetten çekilir, yüklenemezse hata ikonu gösterilir
      Image.network(
        imageUrl,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 200,
          color: Colors.grey[200],
          child: const Icon(Icons.image_not_supported),
        ),
      ),
      // Yazar Etiketi - Görselin sol alt köşesinde yazar ismini gösterir
      Positioned(
        bottom: 12,
        left: 12,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            author,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ],
  );
}
