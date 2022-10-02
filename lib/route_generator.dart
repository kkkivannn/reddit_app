// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:reddit_app/feature/presentation/home/view/home_page.dart';
import 'feature/presentation/post/view/post_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/PostPage':
        final arguments = settings.arguments as Map<String, dynamic>;
        if (arguments['like'] is int &&
            arguments['title'] is String &&
            arguments['selfText'] is String) {
          return MaterialPageRoute(
              builder: (context) => PostPage(
                    title: arguments['title'] as String,
                    like: arguments['like'] as int,
                    selfText: arguments['selfText'] as String,
                    urlOverriddenByDest:
                        arguments["urlOverriddenByDest"] as dynamic,
                  ));
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text('Error!'),
      ),
    );
  });
}
