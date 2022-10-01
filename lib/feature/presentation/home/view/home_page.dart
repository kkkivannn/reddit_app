import 'package:flutter/material.dart';
import 'package:reddit_app/feature/data/datasource/reddit_remote_datasource_implement.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    RedditRemoteDatasourceImplement redditRemoteDatasourceImplement =
        RedditRemoteDatasourceImplement();
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            redditRemoteDatasourceImplement.getPosts('/r/flutterdev/new.json');
          },
          child: const Text('data'),
        ),
      ),
    );
  }
}
