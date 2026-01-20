import 'package:flutter/material.dart';

/// Hikaye kartındaki yazar ismini gösteren gri metin bileşeni.
class StoriesListCardContent extends StatelessWidget {
  final String author;

  const StoriesListCardContent({required this.author, super.key});

  @override
  Widget build(BuildContext context) => Text(
    author,
    style: TextStyle(
      fontSize: 14,
      color: Colors.grey[500],
      fontWeight: FontWeight.w400,
    ),
  );
}
