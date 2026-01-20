import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki yazar bilgisi bileşeni.
class StoriesDetailAuthor extends StatelessWidget {
  final String author;

  const StoriesDetailAuthor({required this.author, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        'BY ',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).textTheme.bodySmall?.color,
          letterSpacing: 1.2,
        ),
      ),
      Text(
        author.toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Theme.of(context).colorScheme.secondary,
          decorationThickness: 2,
        ),
      ),
    ],
  );
}
