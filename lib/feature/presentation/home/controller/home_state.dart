// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:reddit_app/feature/domain/entitis/post_entiti.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final PostEntiti postEntiti;

  HomeLoadedState(this.postEntiti);
  @override
  List<Object?> get props => [postEntiti];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
