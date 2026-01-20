import 'package:fpdart/fpdart.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/story_entity.dart';
import '../../domain/repositories/detail_repository.dart';
import '../datasources/detail_remote_data_source.dart';

/// [DetailRepository] arayüzünün somut gerçekleştirimi.
class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource remoteDataSource;

  DetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, StoryEntity>> getStoryDetail(String id) async {
    try {
      final story = await remoteDataSource.getStoryDetail(id);
      return Right(story);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure('Detay getirilirken beklenmedik bir hata oluştu: $e'),
      );
    }
  }
}
