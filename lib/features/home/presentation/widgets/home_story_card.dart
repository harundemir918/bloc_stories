import 'package:flutter/material.dart';

import '../../domain/entities/story_entity.dart';
import 'home_story_card_content.dart';
import 'home_story_card_footer.dart';
import 'home_story_card_image.dart';
import 'home_story_card_title.dart';

/// Her bir hikayeyi görselleştiren kart bileşeni.
class HomeStoryCard extends StatelessWidget {
  final StoryEntity story;

  const HomeStoryCard({required this.story, super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hikaye Görseli ve Yazar Bilgisi
          HomeStoryCardImage(imageUrl: story.imageUrl, author: story.author),
          // Hikaye Bilgileri alanı
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeStoryCardTitle(title: story.title),
                const SizedBox(height: 8),
                HomeStoryCardContent(content: story.content),
                const SizedBox(height: 16),
                HomeStoryCardFooter(createdAt: story.createdAt),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
