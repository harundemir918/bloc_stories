import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki ana görsel bileşeni.
class StoriesDetailImage extends StatelessWidget {
  final String imageUrl;

  const StoriesDetailImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.network(
      imageUrl,
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 250,
        color: Colors.grey[100],
        child: const Icon(Icons.image_not_supported, size: 50),
      ),
    ),
  );
}
