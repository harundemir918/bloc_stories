import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart' as di;
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_event.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  // Flutter binding'lerini hazırla
  WidgetsFlutterBinding.ensureInitialized();

  // Bağımlılıkları (Dependency Injection) başlat
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Story App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6A11CB), // Modern bir mor tonu
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    ),
    // BLoC'u tüm uygulama veya ilgili rota seviyesinde sağlıyoruz
    home: BlocProvider(
      create: (_) => di.sl<HomeBloc>()..add(FetchStoriesEvent()),
      child: const HomeScreen(),
    ),
  );
}
