import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_story_detail.dart';
import 'stories_detail_event.dart';
import 'stories_detail_state.dart';

/// Hikaye detay ekranının iş mantığını yöneten BLoC sınıfı.
class StoriesDetailBloc extends Bloc<StoriesDetailEvent, StoriesDetailState> {
  final GetStoryDetail getStoryDetail;

  StoriesDetailBloc({required this.getStoryDetail})
    : super(StoriesDetailInitial()) {
    on<StoriesDetailFetched>((event, emit) async {
      emit(StoriesDetailLoadInProgress());

      final result = await getStoryDetail(event.storyId);

      result.fold(
        (failure) => emit(StoriesDetailLoadFailure(failure.message)),
        (story) => emit(StoriesDetailLoadSuccess(story)),
      );
    });
  }
}
