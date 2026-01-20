import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılacak özelleştirilmiş AppBar bileşeni.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    title: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(color: Colors.white),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.deepPurpleAccent,
  );
}
