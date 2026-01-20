import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki ana içerik metni bileşeni.
class StoriesDetailContent extends StatelessWidget {
  final String content;

  const StoriesDetailContent({required this.content, super.key});

  @override
  Widget build(BuildContext context) => Text(
    content,
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
  );
}
