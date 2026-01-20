import 'package:flutter/material.dart';

/// Hikaye kartının alt kısmındaki tarih ve aksiyon ikonunu gösteren bileşen.
class HomeStoryCardFooter extends StatelessWidget {
  final DateTime createdAt;

  const HomeStoryCardFooter({required this.createdAt, super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        _formatDate(createdAt),
        style: TextStyle(fontSize: 12, color: Colors.grey[400]),
      ),
      Icon(Icons.arrow_forward_rounded, color: Theme.of(context).primaryColor),
    ],
  );

  // Gün/Ay/Yıl formatında basit tarih gösterimi
  String _formatDate(DateTime date) => "${date.day}/${date.month}/${date.year}";
}
