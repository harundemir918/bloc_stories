import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/story_entity.dart';

/// Hikaye detaylarını getirmek için kullanılan repository arayüzü.
abstract class DetailRepository {
  /// Belirli bir ID'ye sahip hikayeyi döner.
  Future<Either<Failure, StoryEntity>> getStoryDetail(String id);
}
