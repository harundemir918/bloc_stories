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
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[500],
          letterSpacing: 1.2,
        ),
      ),
      Text(
        author.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1A1A),
          decoration: TextDecoration.underline,
          decorationColor: Colors.pinkAccent,
          decorationThickness: 2,
        ),
      ),
    ],
  );
}
