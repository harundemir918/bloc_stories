/// Veri katmanında oluşabilecek hatalar için temel istisna sınıfı.
class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

/// Veri kaynağına erişilemediği durumlar için istisna sınıfı.
class CacheException implements Exception {
  final String message;
  CacheException(this.message);

  @override
  String toString() => 'CacheException: $message';
}
