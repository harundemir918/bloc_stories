import 'package:flutter/material.dart';

import '../widgets/stories_app_bar.dart';
import '../widgets/stories_body.dart';

/// Hikaye listeleme ekranı.
class StoriesListScreen extends StatelessWidget {
  const StoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(appBar: StoriesAppBar(), body: StoriesBody());
}
