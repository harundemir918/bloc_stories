import 'package:fpdart/fpdart.dart';
import '../error/failures.dart';

/// Tüm "UseCase" sınıfları için temel bir arayüz sağlar.
/// [Type]: Başarılı durumda dönülecek veri tipi.
/// [Params]: UseCase'e geçirilecek parametreler sınıfı.
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Parametre gerektirmeyen durumlar için boş bir sınıf.
class NoParams {}
