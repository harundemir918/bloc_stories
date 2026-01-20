import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../bloc/stories_detail_bloc.dart';
import '../bloc/stories_detail_event.dart';
import '../bloc/stories_detail_state.dart';

/// Hikaye detaylarının gösterildiği ekran.
class StoriesDetailScreen extends StatelessWidget {
  final String storyId;

  const StoriesDetailScreen({required this.storyId, super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<StoriesDetailBloc>()..add(FetchStoryDetailEvent(storyId)),
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: ''),
      body: BlocBuilder<StoriesDetailBloc, StoriesDetailState>(
        builder: (context, state) {
          if (state is StoriesDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoriesDetailLoaded) {
            final story = state.story;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      story.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 250,
                        color: Colors.grey[100],
                        child: const Icon(Icons.image_not_supported, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    story.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'BY ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        story.author.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.pinkAccent,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SYNOPSIS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        '15 MIN READ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    story.content,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4A4A4A),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          } else if (state is StoriesDetailError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Yükleniyor...'));
        },
      ),
    ),
  );
}
