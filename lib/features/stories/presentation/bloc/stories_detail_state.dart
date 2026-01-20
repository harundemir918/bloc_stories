import '../../domain/entities/story_entity.dart';

abstract class StoriesDetailState {}

class StoriesDetailInitial extends StoriesDetailState {}

class StoriesDetailLoadInProgress extends StoriesDetailState {}

class StoriesDetailLoadSuccess extends StoriesDetailState {
  final StoryEntity story;
  StoriesDetailLoadSuccess(this.story);
}

class StoriesDetailLoadFailure extends StoriesDetailState {
  final String message;
  StoriesDetailLoadFailure(this.message);
}
