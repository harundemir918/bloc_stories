abstract class DetailEvent {}

/// Belirli bir hikayenin detaylarını getirmeyi tetikleyen olay.
class FetchStoryDetailEvent extends DetailEvent {
  final String storyId;
  FetchStoryDetailEvent(this.storyId);
}
