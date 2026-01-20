import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import 'home_retry.dart';
import 'home_story_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Ana sayfanın gövde kısmını yöneten bileşen.
/// BLoC durumlarına (Loading, Loaded, Error) göre farklı arayüzler sunar.
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () async {
      // Sayfayı yenileme (Pull to refresh)
      context.read<HomeBloc>().add(FetchStoriesEvent());
    },
    child: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          return HomeStoryList(stories: state.stories);
        } else if (state is HomeError) {
          return HomeRetry(message: state.message);
        }
        return const Center(child: Text('Hikaye yükleniyor...'));
      },
    ),
  );
}
