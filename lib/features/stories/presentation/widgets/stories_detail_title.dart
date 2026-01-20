import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki başlık bileşeni.
class StoriesDetailTitle extends StatelessWidget {
  final String title;

  const StoriesDetailTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: Theme.of(
      context,
    ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
  );
}
