abstract class StoriesDetailEvent {}

/// Belirli bir hikayenin detaylarını getirmeyi tetikleyen olay.
class FetchStoryDetailEvent extends StoriesDetailEvent {
  final String storyId;
  FetchStoryDetailEvent(this.storyId);
}
