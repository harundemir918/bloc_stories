import 'package:flutter/material.dart';

import '../../domain/entities/story_entity.dart';
import 'home_story_card.dart';

/// Hikayelerin liste halinde gösterildiği bileşen.
class HomeStoryList extends StatelessWidget {
  final List<StoryEntity> stories;
  const HomeStoryList({required this.stories, super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    itemCount: stories.length,
    itemBuilder: (context, index) {
      final story = stories[index];
      return HomeStoryCard(story: story);
    },
  );
}
