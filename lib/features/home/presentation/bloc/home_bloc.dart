import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_stories.dart';
import 'home_event.dart';
import 'home_state.dart';

/// Ana sayfa ekranının iş mantığını yöneten BLoC sınıfı.
/// `fpdart`'ın Either yapısını kullanarak hata ve başarı durumlarını yönetir.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetStories getStories;

  HomeBloc({required this.getStories}) : super(HomeInitial()) {
    // Hikayeleri getir olayını dinliyoruz
    on<FetchStoriesEvent>(_onFetchStories);
  }

  Future<void> _onFetchStories(
    FetchStoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading()); // Yükleniyor durumuna geç

    // UseCase'i çağırıyoruz (Parametre gerekmediği için NoParams() geçiyoruz)
    final result = await getStories(NoParams());

    // fpdart fold fonksiyonu ile Left (hata) veya Right (başarı) durumunu işliyoruz
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (stories) => emit(HomeLoaded(stories)),
    );
  }
}
