// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:reddit_app/feature/data/datasource/reddit_remote_datasource.dart';
import 'package:reddit_app/feature/data/datasource/reddit_remote_datasource_implement.dart';
import 'package:reddit_app/feature/data/repository/reddit_implement.dart';
import 'package:reddit_app/feature/domain/repositories/reddit.dart';
import 'package:reddit_app/feature/domain/usecases/get_posts.dart';
import 'package:reddit_app/feature/presentation/home/controller/home_cubit.dart';

final sl = GetIt.asNewInstance();
Future<void> init() async {
  //Cubit
  sl.registerFactory(() => HomeCubit(getPosts: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetPosts(sl()));
  //Repository
  sl.registerLazySingleton<RedditRepository>(
      () => RedditRepositoryImplement(sl()));
  //Datasource
  sl.registerLazySingleton<RedditRemoteDatasource>(
      () => RedditRemoteDatasourceImplement());
}
