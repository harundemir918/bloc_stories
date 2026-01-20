import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılacak özelleştirilmiş AppBar bileşeni.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({required this.title, this.actions, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    actions: actions,
  );
}
