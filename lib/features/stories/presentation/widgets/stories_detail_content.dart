import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki ana içerik metni bileşeni.
class StoriesDetailContent extends StatelessWidget {
  final String content;

  const StoriesDetailContent({required this.content, super.key});

  @override
  Widget build(BuildContext context) => Text(
    content,
    style: const TextStyle(fontSize: 18, color: Color(0xFF4A4A4A), height: 1.6),
  );
}
