import 'package:flutter/material.dart';

/// Hikaye kartındaki içerik özetini gösteren bileşen.
class HomeStoryCardContent extends StatelessWidget {
  final String content;

  const HomeStoryCardContent({required this.content, super.key});

  @override
  Widget build(BuildContext context) => Text(
    content,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
  );
}
