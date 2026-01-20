import 'package:fpdart/fpdart.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/story_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

/// Domain katmanındaki [HomeRepository] arayüzünün somut gerçekleştirimi.
/// Veri kaynağını (DataSource) kullanarak hem hata yönetimini yapar hem veriyi döner.
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<StoryEntity>>> getStories() async {
    try {
      final stories = await remoteDataSource.getStories();
      return Right(stories); // Başarılı sonuç (fpdart)
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message)); // Bilinen sunucu hatası
    } catch (e) {
      return Left(ServerFailure('Veri işlenirken bir hata oluştu: $e'));
    }
  }
}
