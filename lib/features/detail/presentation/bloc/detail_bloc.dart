import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_story_detail.dart';
import 'detail_event.dart';
import 'detail_state.dart';

/// Hikaye detay ekranının durum yönetimini (state management) yapan BLoC sınıfı.
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetStoryDetail getStoryDetail;

  DetailBloc({required this.getStoryDetail}) : super(DetailInitial()) {
    on<FetchStoryDetailEvent>((event, emit) async {
      emit(DetailLoading());

      final result = await getStoryDetail(event.storyId);

      result.fold(
        (failure) => emit(DetailError(failure.message)),
        (story) => emit(DetailLoaded(story)),
      );
    });
  }
}
