import 'package:flutter/material.dart';

import '../../domain/entities/story_entity.dart';
import 'stories_list_card.dart';

/// Hikayelerin liste halinde gösterildiği bileşen.
class StoriesList extends StatelessWidget {
  final List<StoryEntity> stories;
  const StoriesList({required this.stories, super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    itemCount: stories.length,
    itemBuilder: (context, index) {
      final story = stories[index];
      return StoriesListCard(story: story);
    },
  );
}
