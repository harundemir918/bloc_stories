/// Ana sayfa (Home) ekranında gerçekleşebilecek olayların temel sınıfı.
abstract class HomeEvent {}

/// Hikayeleri sunucudan çekmek için tetiklenen olay.
class FetchStoriesEvent extends HomeEvent {}
