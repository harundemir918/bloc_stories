import 'package:flutter/material.dart';

import '../../domain/entities/story_entity.dart';
import '../screens/stories_detail_screen.dart';
import 'stories_list_card_content.dart'; // This file now contains HomeStoryCardAuthor
import 'stories_list_card_footer.dart';
import 'stories_list_card_image.dart';
import 'stories_list_card_title.dart';

/// Her bir hikayeyi görselleştiren kart bileşeni. (Yatay Tasarım)
class StoriesListCard extends StatelessWidget {
  final StoryEntity story;

  const StoriesListCard({required this.story, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoriesDetailScreen(storyId: story.id),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(24),
        border: Theme.of(context).cardTheme.shape is RoundedRectangleBorder
            ? Border.fromBorderSide(
                (Theme.of(context).cardTheme.shape as RoundedRectangleBorder)
                    .side,
              )
            : null,
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          // Sol taraf: Görsel
          StoriesListCardImage(imageUrl: story.imageUrl, author: story.author),
          const SizedBox(width: 16),
          // Orta taraf: Bilgiler
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoriesListCardTitle(title: story.title),
                const SizedBox(height: 4),
                StoriesListCardContent(author: story.author),
                const SizedBox(height: 12),
                StoriesListCardFooter(
                  createdAt: story.createdAt,
                  author: story.author,
                ),
              ],
            ),
          ),
          // Sağ taraf: Ok işareti (Opsiyonel ama görselde var)
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ],
      ),
    ),
  );
}
