import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_stories.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';

// Bağımlılıkların yönetildiği servis kayıt defteri
final sl = GetIt.instance; // sl: Service Locator

/// Uygulama başladığında tüm bağımlılıkları kaydeden fonksiyon.
Future<void> init() async {
  // --- Features - Home ---

  // Bloc (Factories her çağrıldığında yeni bir nesne oluşturur)
  sl
    ..registerFactory(() => HomeBloc(getStories: sl()))
    // Use Cases (LazySingleton ihtiyaç duyulduğunda bir kez oluşturulur)
    ..registerLazySingleton(() => GetStories(sl()))
    // Repository
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))
    // Data Sources
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()),
    )
    // --- Core / External ---
    // Dio (Ağ istekleri için)
    ..registerLazySingleton(() => Dio());
}
