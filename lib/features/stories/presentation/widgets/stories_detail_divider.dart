import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki pembe ayırıcı çizgi bileşeni.
class StoriesDetailDivider extends StatelessWidget {
  const StoriesDetailDivider({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: 40,
    height: 4,
    decoration: BoxDecoration(
      color: Colors.pink[100],
      borderRadius: BorderRadius.circular(2),
    ),
  );
}
