import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_body.dart';

/// Ana sayfa ekranı. Hikayelerin listelendiği ana alan.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    backgroundColor: Color(0xFFF5F7FA), // Yumuşak bir arka plan rengi
    appBar: HomeAppBar(),
    body: HomeBody(),
  );
}
