import 'package:flutter/material.dart';

/// Hikaye kartının üst kısmındaki görsel ve yazar ismini gösteren bileşen.
class StoriesListCardImage extends StatelessWidget {
  final String imageUrl;
  final String author;

  const StoriesListCardImage({
    required this.imageUrl,
    required this.author,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.network(
      imageUrl,
      height: 100,
      width: 100,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 100,
        width: 100,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(
          Icons.image_not_supported,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
    ),
  );
}
