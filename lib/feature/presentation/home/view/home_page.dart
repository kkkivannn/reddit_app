// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:reddit_app/feature/presentation/home/controller/home_cubit.dart';
import 'package:reddit_app/feature/presentation/home/controller/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeEmptyState) {
          context.read<HomeCubit>().fetchPosts('/r/flutterdev/new.json');
        } else if (state is HomeErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error!'),
            ),
          );
        } else if (state is HomeLoadedState) {
          return Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  print('Good!');
                },
                child: const Text('data'),
              ),
            ),
          );
        }
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
