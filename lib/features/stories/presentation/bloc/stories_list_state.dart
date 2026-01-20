import '../../domain/entities/story_entity.dart';

abstract class StoriesListState {}

class StoriesListInitial extends StoriesListState {}

class StoriesListLoadInProgress extends StoriesListState {}

class StoriesListLoadSuccess extends StoriesListState {
  final List<StoryEntity> stories;
  StoriesListLoadSuccess(this.stories);
}

class StoriesListLoadFailure extends StoriesListState {
  final String message;
  StoriesListLoadFailure(this.message);
}
