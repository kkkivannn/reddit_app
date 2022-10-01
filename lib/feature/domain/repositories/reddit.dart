// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:reddit_app/core/error/failure.dart';
import 'package:reddit_app/feature/domain/entitis/post_entiti.dart';

abstract class RedditRepository {
  Future<Either<Failure, PostEntiti>> getPosts(String endpoint);
}
