import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stories_list_bloc.dart';
import '../bloc/stories_list_event.dart';

/// Hata oluştuğunda kullanıcıya hata mesajı gösteren ve
/// tekrar deneme imkanı sunan bileşen.
class StoriesRetry extends StatelessWidget {
  final String message;
  const StoriesRetry({required this.message, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 60),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () =>
              context.read<StoriesListBloc>().add(FetchStoriesEvent()),
          child: const Text('Tekrar Dene'),
        ),
      ],
    ),
  );
}
