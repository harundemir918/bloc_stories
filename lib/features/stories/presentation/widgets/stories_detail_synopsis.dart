import 'package:flutter/material.dart';

/// Hikaye detay sayfasındaki özet ve okuma süresi başlıkları bileşeni.
class StoriesDetailSynopsis extends StatelessWidget {
  const StoriesDetailSynopsis({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'SYNOPSIS',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
          letterSpacing: 1.5,
        ),
      ),
      Text(
        '15 MIN READ',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
          letterSpacing: 1.5,
        ),
      ),
    ],
  );
}
