import '../../domain/entities/story_entity.dart';

/// Ana sayfa ekranının farklı durumlarını temsil eden temel sınıf.
abstract class HomeState {}

/// İlk durum (Başlangıç).
class HomeInitial extends HomeState {}

/// Veriler yüklenirken (Loading) kullanılan durum.
class HomeLoading extends HomeState {}

/// Veriler başarıyla yüklendiğinde kullanılan durum.
class HomeLoaded extends HomeState {
  final List<StoryEntity> stories;
  HomeLoaded(this.stories);
}

/// Bir hata oluştuğunda kullanılan durum.
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
