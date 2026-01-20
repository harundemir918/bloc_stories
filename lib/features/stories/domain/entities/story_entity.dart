/// Hikaye verisini temsil eden temel varlık (Entity).
/// Domain katmanı olduğu için herhangi bir paket bağımlılığı taşımaz.
class StoryEntity {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final DateTime createdAt;

  StoryEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.createdAt,
  });

  // Not: Equatable paketi kullanılmadığı için içerik karşılaştırması
  // yapılmak istenirse == operatörü manuel override edilmelidir.
  // Bu basit projede şimdilik gerek duyulmadı.
}
