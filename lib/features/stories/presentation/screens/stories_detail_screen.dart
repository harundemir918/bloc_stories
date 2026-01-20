import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../bloc/stories_detail_bloc.dart';
import '../bloc/stories_detail_event.dart';
import '../bloc/stories_detail_state.dart';
import '../widgets/stories_detail_author.dart';
import '../widgets/stories_detail_content.dart';
import '../widgets/stories_detail_divider.dart';
import '../widgets/stories_detail_image.dart';
import '../widgets/stories_detail_synopsis.dart';
import '../widgets/stories_detail_title.dart';

/// Hikaye detaylarının gösterildiği ekran.
class StoriesDetailScreen extends StatelessWidget {
  final String storyId;

  const StoriesDetailScreen({required this.storyId, super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<StoriesDetailBloc>()..add(StoriesDetailFetched(storyId)),
    child: Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: BlocBuilder<StoriesDetailBloc, StoriesDetailState>(
        builder: (context, state) {
          if (state is StoriesDetailLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoriesDetailLoadSuccess) {
            final story = state.story;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoriesDetailImage(imageUrl: story.imageUrl),
                  const SizedBox(height: 32),
                  StoriesDetailTitle(title: story.title),
                  const SizedBox(height: 12),
                  StoriesDetailAuthor(author: story.author),
                  const SizedBox(height: 24),
                  const StoriesDetailDivider(),
                  const SizedBox(height: 32),
                  const StoriesDetailSynopsis(),
                  const SizedBox(height: 24),
                  StoriesDetailContent(content: story.content),
                  const SizedBox(height: 40),
                ],
              ),
            );
          } else if (state is StoriesDetailLoadFailure) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Yükleniyor...'));
        },
      ),
    ),
  );
}
