import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/detail/data/datasources/detail_remote_data_source.dart';
import '../../features/detail/data/repositories/detail_repository_impl.dart';
import '../../features/detail/domain/repositories/detail_repository.dart';
import '../../features/detail/domain/usecases/get_story_detail.dart';
import '../../features/detail/presentation/bloc/detail_bloc.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_stories.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';

// Bağımlılıkların yönetildiği servis kayıt defteri
final sl = GetIt.instance; // sl: Service Locator

/// Uygulama başladığında tüm bağımlılıkları kaydeden fonksiyon.
Future<void> init() async {
  _initCore();
  _initHome();
  _initDetail();
}

/// Çekirdek (Core) ve harici (External) bağımlılıkların kaydı.
void _initCore() {
  sl.registerLazySingleton(() => Dio());
}

/// Home özelliğine ait bağımlılıkların kaydı.
void _initHome() {
  sl
    ..registerFactory(() => HomeBloc(getStories: sl()))
    ..registerLazySingleton(() => GetStories(sl()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()),
    );
}

/// Detail özelliğine ait bağımlılıkların kaydı.
void _initDetail() {
  sl
    ..registerFactory(() => DetailBloc(getStoryDetail: sl()))
    ..registerLazySingleton(() => GetStoryDetail(sl()))
    ..registerLazySingleton<DetailRepository>(() => DetailRepositoryImpl(sl()))
    ..registerLazySingleton<DetailRemoteDataSource>(
      () => DetailRemoteDataSourceImpl(sl()),
    );
}
