import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki başlık bileşeni.
class StoriesDetailTitle extends StatelessWidget {
  final String title;

  const StoriesDetailTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
  );
}
