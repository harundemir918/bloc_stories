/// Uygulama genelinde hata yönetimi için kullanılan temel sınıf.
/// [Failure] her zaman bir hata mesajı içerir.
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// Sunucu kaynaklı hatalar için kullanılan sınıf.
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

/// İnternet bağlantısı veya veri kaynağı hataları için kullanılan sınıf.
class ConnectionFailure extends Failure {
  ConnectionFailure(super.message);
}
