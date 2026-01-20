import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/story_entity.dart';
import '../repositories/stories_repository.dart';

/// Belirli bir hikayenin detaylarını getiren UseCase.
class GetStoryDetail implements UseCase<StoryEntity, String> {
  final StoriesRepository repository;

  GetStoryDetail(this.repository);

  @override
  Future<Either<Failure, StoryEntity>> call(String id) async =>
      repository.getStoryDetail(id);
}
