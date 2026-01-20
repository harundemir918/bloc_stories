import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/theme/bloc/theme_bloc.dart';
import '../../../../core/common/theme/bloc/theme_event.dart';
import '../../../../core/common/theme/bloc/theme_state.dart';
import '../../../../core/widgets/custom_app_bar.dart';

/// Ana sayfa için özel olarak tasarlanmış AppBar bileşeni.
class StoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoriesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, state) => CustomAppBar(
      title: 'Hikayeler',
      actions: [
        IconButton(
          icon: Icon(
            state.themeMode == ThemeMode.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          onPressed: () => context.read<ThemeBloc>().add(ThemeToggled()),
        ),
      ],
    ),
  );
}
