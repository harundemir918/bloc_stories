import '../../domain/entities/story_entity.dart';

abstract class StoriesListState {}

class StoriesListInitial extends StoriesListState {}

class StoriesListLoading extends StoriesListState {}

class StoriesListLoaded extends StoriesListState {
  final List<StoryEntity> stories;
  StoriesListLoaded(this.stories);
}

class StoriesListError extends StoriesListState {
  final String message;
  StoriesListError(this.message);
}
