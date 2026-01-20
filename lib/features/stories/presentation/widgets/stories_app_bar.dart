import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

/// Ana sayfa için özel olarak tasarlanmış AppBar bileşeni.
/// [CustomAppBar] bileşenini temel alır.
class StoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoriesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) =>
      const CustomAppBar(title: 'Günün Hikayeleri');
}
