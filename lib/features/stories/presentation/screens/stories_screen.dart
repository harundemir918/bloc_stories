import 'package:flutter/material.dart';

import '../widgets/stories_app_bar.dart';
import '../widgets/stories_body.dart';

/// Hikaye listeleme ekranı.
class StoriesListScreen extends StatelessWidget {
  const StoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    backgroundColor: Color(0xFFF5F7FA), // Yumuşak bir arka plan rengi
    appBar: StoriesAppBar(),
    body: StoriesBody(),
  );
}
