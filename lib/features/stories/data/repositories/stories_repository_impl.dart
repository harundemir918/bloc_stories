import 'package:fpdart/fpdart.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/story_entity.dart';
import '../../domain/repositories/stories_repository.dart';
import '../datasources/stories_remote_data_source.dart';

/// [StoriesRepository] arayüzünün somut gerçekleştirimi.
class StoriesRepositoryImpl implements StoriesRepository {
  final StoriesRemoteDataSource remoteDataSource;

  StoriesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<StoryEntity>>> getStories() async {
    try {
      final stories = await remoteDataSource.getStories();
      return Right(stories);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Hikayeler işlenirken bir hata oluştu: $e'));
    }
  }

  @override
  Future<Either<Failure, StoryEntity>> getStoryDetail(String id) async {
    try {
      final story = await remoteDataSource.getStoryDetail(id);
      return Right(story);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Detay getirilirken bir hata oluştu: $e'));
    }
  }
}
