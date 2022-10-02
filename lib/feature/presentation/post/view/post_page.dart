// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:reddit_app/theme/icon.dart';

class PostPage extends StatelessWidget {
  final String title;
  final int like;
  final String selfText;
  final dynamic urlOverriddenByDest;
  const PostPage({
    super.key,
    required this.title,
    required this.like,
    required this.selfText,
    required this.urlOverriddenByDest,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reddit',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                SvgIcon.reddit,
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text(
                          like.toString(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Color(0xffFC471E),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            height: 3,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xffFC471E),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          urlOverriddenByDest.toString() == 'null'
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () async {
                      if (!await launchUrl(
                        Uri.parse(urlOverriddenByDest),
                        mode: LaunchMode.inAppWebView,
                      )) {
                        throw 'Could not launch $urlOverriddenByDest';
                      }
                    },
                    child: Text(urlOverriddenByDest.toString()),
                  ),
                ),
          selfText == ''
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    selfText,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
