import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_stories.dart';
import 'stories_list_event.dart';
import 'stories_list_state.dart';

/// Hikaye listeleme ekranının iş mantığını yöneten BLoC sınıfı.
class StoriesListBloc extends Bloc<StoriesListEvent, StoriesListState> {
  final GetStories getStories;

  StoriesListBloc({required this.getStories}) : super(StoriesListInitial()) {
    on<StoriesListFetched>(_onStoriesListFetched);
  }

  Future<void> _onStoriesListFetched(
    StoriesListFetched event,
    Emitter<StoriesListState> emit,
  ) async {
    emit(StoriesListLoadInProgress());

    final result = await getStories(NoParams());

    result.fold(
      (failure) => emit(StoriesListLoadFailure(failure.message)),
      (stories) => emit(StoriesListLoadSuccess(stories)),
    );
  }
}
