import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/story_entity.dart';

/// Hikaye işlemlerini (liste ve detay) tanımlayan repository arayüzü.
abstract class StoriesRepository {
  Future<Either<Failure, List<StoryEntity>>> getStories();
  Future<Either<Failure, StoryEntity>> getStoryDetail(String id);
}
