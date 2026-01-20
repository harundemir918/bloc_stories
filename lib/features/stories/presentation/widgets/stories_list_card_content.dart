import 'package:flutter/material.dart';

/// Hikaye kartındaki yazar ismini gösteren gri metin bileşeni.
class StoriesListCardContent extends StatelessWidget {
  final String author;

  const StoriesListCardContent({required this.author, super.key});

  @override
  Widget build(BuildContext context) =>
      Text(author, style: Theme.of(context).textTheme.bodyMedium);
}
