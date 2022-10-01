// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import 'package:reddit_app/constants.dart';
import 'package:reddit_app/core/error/exception.dart';
import 'package:reddit_app/feature/data/datasource/reddit_remote_datasource.dart';
import 'package:reddit_app/feature/data/models/post_model.dart';

class RedditRemoteDatasourceImplement implements RedditRemoteDatasource {
  Dio _dio = Dio();
  RedditRemoteDatasourceImplement() {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
    initializeInterceptor();
  }
  initializeInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  @override
  Future<PostModel> getPosts(String endpoint) async {
    final response = await _dio.get(endpoint);
    if (response.statusCode == 200) {
      return PostModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
