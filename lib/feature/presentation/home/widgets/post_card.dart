// Flutter imports:
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String url;
  const PostCard({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (url == 'self' || url == 'default')
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.network(
                        url,
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
