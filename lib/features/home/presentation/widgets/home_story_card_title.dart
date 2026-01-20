import 'package:flutter/material.dart';

/// Hikaye kartındaki başlık metnini gösteren bileşen.
class HomeStoryCardTitle extends StatelessWidget {
  final String title;

  const HomeStoryCardTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2D3436),
    ),
  );
}
