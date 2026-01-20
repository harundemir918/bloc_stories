import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/stories_list_bloc.dart';
import '../bloc/stories_list_event.dart';
import '../bloc/stories_list_state.dart';
import 'stories_retry.dart';
import 'stories_list.dart';

/// Ana sayfanın gövde kısmını yöneten bileşen.
/// BLoC durumlarına (Loading, Loaded, Error) göre farklı arayüzler sunar.
class StoriesBody extends StatelessWidget {
  const StoriesBody({super.key});

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () async {
      // Sayfayı yenileme (Pull to refresh)
      context.read<StoriesListBloc>().add(FetchStoriesEvent());
    },
    child: BlocBuilder<StoriesListBloc, StoriesListState>(
      builder: (context, state) {
        if (state is StoriesListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StoriesListLoaded) {
          return StoriesList(stories: state.stories);
        } else if (state is StoriesListError) {
          return StoriesRetry(message: state.message);
        }
        return const Center(child: Text('Hikaye yükleniyor...'));
      },
    ),
  );
}
