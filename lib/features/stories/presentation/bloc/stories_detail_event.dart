abstract class StoriesDetailEvent {}

/// Belirli bir hikayenin detaylarını getirmeyi tetikleyen olay.
class StoriesDetailFetched extends StoriesDetailEvent {
  final String storyId;
  StoriesDetailFetched(this.storyId);
}
