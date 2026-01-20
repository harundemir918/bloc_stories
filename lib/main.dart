import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/theme/bloc/theme_bloc.dart';
import 'core/common/theme/bloc/theme_state.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'features/stories/presentation/bloc/stories_list_bloc.dart';
import 'features/stories/presentation/bloc/stories_list_event.dart';
import 'features/stories/presentation/screens/stories_screen.dart';

void main() async {
  // Flutter binding'lerini hazırla
  WidgetsFlutterBinding.ensureInitialized();

  // Bağımlılıkları (Dependency Injection) başlat
  await di.init();

  runApp(BlocProvider(create: (_) => di.sl<ThemeBloc>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, state) => MaterialApp(
      title: 'Story App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: state.themeMode,
      home: BlocProvider(
        create: (_) => di.sl<StoriesListBloc>()..add(StoriesListFetched()),
        child: const StoriesListScreen(),
      ),
    ),
  );
}
