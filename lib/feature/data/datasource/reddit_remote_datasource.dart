import 'package:reddit_app/feature/data/models/post_model.dart';

abstract class RedditRemoteDatasource {
  Future<PostModel> getPosts(String endpoint);
}
