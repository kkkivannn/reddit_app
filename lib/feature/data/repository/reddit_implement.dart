// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:reddit_app/core/error/failure.dart';
import 'package:reddit_app/feature/data/datasource/reddit_remote_datasource.dart';
import 'package:reddit_app/feature/data/models/post_model.dart';
import 'package:reddit_app/feature/domain/entitis/post_entiti.dart';
import 'package:reddit_app/feature/domain/repositories/reddit.dart';

class RedditRepositoryImplement implements RedditRepository {
  final RedditRemoteDatasource redditRemoteDatasource;

  RedditRepositoryImplement(this.redditRemoteDatasource);
  @override
  Future<Either<Failure, PostEntiti>> getPosts(String endpoint) async {
    return await _getPosts(
      () => redditRemoteDatasource.getPosts(endpoint),
    );
  }

  Future<Either<Failure, PostModel>> _getPosts(
      Future<PostModel> Function() reddit) async {
    try {
      final postsModel = await reddit();
      return Right(postsModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
