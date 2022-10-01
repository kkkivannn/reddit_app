// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:reddit_app/constants.dart';
import 'package:reddit_app/feature/domain/usecases/get_posts.dart';
import 'package:reddit_app/feature/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPosts getPosts;

  HomeCubit({required this.getPosts}) : super(HomeEmptyState());
  Future<void> fetchPosts(String endpoint) async {
    try {
      emit(HomeEmptyState());
      final loadedPostsOrFailure =
          await getPosts.call(EndpointParams(endpoint: endpoint));
      loadedPostsOrFailure.fold(
        (error) => emit(HomeErrorState(message: SERVER_FAILURE_MESSAGE)),
        (loadedData) => emit(HomeLoadedState(loadedData)),
      );
    } catch (_) {
      emit(
        HomeErrorState(message: SERVER_FAILURE_MESSAGE),
      );
    }
  }
}
