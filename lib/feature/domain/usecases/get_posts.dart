// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:reddit_app/core/error/failure.dart';
import 'package:reddit_app/core/usecase/usecase.dart';
import 'package:reddit_app/feature/domain/entitis/post_entiti.dart';
import 'package:reddit_app/feature/domain/repositories/reddit.dart';

class GetPosts implements UseCase<PostEntiti, EndpointParams> {
  final RedditRepository redditRepository;

  GetPosts(this.redditRepository);
  @override
  Future<Either<Failure, PostEntiti>> call(EndpointParams params) async {
    return await redditRepository.getPosts(params.endpoint);
  }
}

class EndpointParams extends Equatable {
  final String endpoint;

  const EndpointParams({
    required this.endpoint,
  });
  @override
  List<Object?> get props => [endpoint];
}
