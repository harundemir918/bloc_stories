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
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodySmall?.color,
          letterSpacing: 1.5,
        ),
      ),
      Text(
        '15 MIN READ',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodySmall?.color,
          letterSpacing: 1.5,
        ),
      ),
    ],
  );
}
