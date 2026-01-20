import '../../domain/entities/story_entity.dart';

abstract class StoriesDetailState {}

class StoriesDetailInitial extends StoriesDetailState {}

class StoriesDetailLoading extends StoriesDetailState {}

class StoriesDetailLoaded extends StoriesDetailState {
  final StoryEntity story;
  StoriesDetailLoaded(this.story);
}

class StoriesDetailError extends StoriesDetailState {
  final String message;
  StoriesDetailError(this.message);
}
