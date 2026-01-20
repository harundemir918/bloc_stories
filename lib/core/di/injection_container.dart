import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/stories/data/datasources/stories_remote_data_source.dart';
import '../../features/stories/data/repositories/stories_repository_impl.dart';
import '../../features/stories/domain/repositories/stories_repository.dart';
import '../../features/stories/domain/usecases/get_stories.dart';
import '../../features/stories/domain/usecases/get_story_detail.dart';
import '../../features/stories/presentation/bloc/stories_list_bloc.dart';
import '../../features/stories/presentation/bloc/stories_detail_bloc.dart';

// Bağımlılıkların yönetildiği servis kayıt defteri
final sl = GetIt.instance; // sl: Service Locator

/// Uygulama başladığında tüm bağımlılıkları kaydeden fonksiyon.
Future<void> init() async {
  _initCore();
  _initStories();
}

/// Çekirdek (Core) ve harici (External) bağımlılıkların kaydı.
void _initCore() {
  sl.registerLazySingleton(() => Dio());
}

/// Stories özelliğine ait bağımlılıkların kaydı.
void _initStories() {
  sl
    // BLoCs
    ..registerFactory(() => StoriesListBloc(getStories: sl()))
    ..registerFactory(() => StoriesDetailBloc(getStoryDetail: sl()))
    // Use Cases
    ..registerLazySingleton(() => GetStories(sl()))
    ..registerLazySingleton(() => GetStoryDetail(sl()))
    // Repository
    ..registerLazySingleton<StoriesRepository>(
      () => StoriesRepositoryImpl(sl()),
    )
    // Data Source
    ..registerLazySingleton<StoriesRemoteDataSource>(
      () => StoriesRemoteDataSourceImpl(sl()),
    );
}
