import '../../../home/domain/entities/story_entity.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final StoryEntity story;
  DetailLoaded(this.story);
}

class DetailError extends DetailState {
  final String message;
  DetailError(this.message);
}
