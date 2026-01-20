import '../../domain/entities/story_entity.dart';

/// Hikaye verisinin JSON dönüşümlerini yöneten model sınıfı.
/// Domain katmanındaki [StoryEntity] varlığını genişletir (extend eder).
class StoryModel extends StoryEntity {
  StoryModel({
    required super.id,
    required super.title,
    required super.content,
    required super.imageUrl,
    required super.author,
    required super.createdAt,
  });

  /// JSON verisini [StoryModel] nesnesine dönüştürür.
  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    id: json['id']
        .toString(), // ID sunucuda sayı veya metin olsa da metne çeviriyoruz
    title: json['title'] ?? '',
    content: json['content'] ?? '',
    imageUrl: json['imageUrl'] ?? '',
    author: json['author'] ?? '',
    createdAt: DateTime.parse(
      json['createdAt'] ?? DateTime.now().toIso8601String(),
    ),
  );

  /// [StoryModel] nesnesini JSON formatına dönüştürür.
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'imageUrl': imageUrl,
    'author': author,
    'createdAt': createdAt.toIso8601String(),
  };
}
