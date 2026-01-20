import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/story_entity.dart';
import '../repositories/stories_repository.dart';

/// Tüm hikayeleri getiren "İş Mantığı" birimi (UseCase).
/// Repository arayüzünü kullanarak veriye ulaşır.
class GetStories implements UseCase<List<StoryEntity>, NoParams> {
  final StoriesRepository repository;

  GetStories(this.repository);

  @override
  Future<Either<Failure, List<StoryEntity>>> call(NoParams params) async =>
      repository.getStories();
}
