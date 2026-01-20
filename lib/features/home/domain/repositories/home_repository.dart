import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/story_entity.dart';

/// Ana sayfa ile ilgili veri işlemlerinin sözleşmesi (Contract).
/// Gerçek uygulama (Implementation) veri katmanında (Data Layer) yapılacaktır.
abstract class HomeRepository {
  /// Sunucudaki tüm hikayeleri getirir.
  Future<Either<Failure, List<StoryEntity>>> getStories();
}
