// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:card_loading/card_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:reddit_app/feature/presentation/home/controller/home_cubit.dart';
import 'package:reddit_app/feature/presentation/home/controller/home_state.dart';
import 'package:reddit_app/feature/presentation/home/widgets/post_card.dart';
import 'package:reddit_app/theme/icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeEmptyState) {
          context.read<HomeCubit>().fetchPosts('/r/flutterdev/new.json');
        } else if (state is HomeErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Error!'),
            ),
          );
        } else if (state is HomeLoadedState) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Reddit',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
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
            body: RefreshIndicator(
              color: const Color(0xffFC471E),
              displacement: 20,
              onRefresh: () => context
                  .read<HomeCubit>()
                  .fetchPosts('/r/flutterdev/new.json'),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: state.postEntiti.data.children.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      '/PostPage',
                      arguments: {
                        'like': state.postEntiti.data.children[index].data.like,
                        'title':
                            state.postEntiti.data.children[index].data.title,
                        'selfText':
                            state.postEntiti.data.children[index].data.selfText,
                        'urlOverriddenByDest': state.postEntiti.data
                            .children[index].data.urlOverriddenByDest,
                      },
                    ),
                    child: PostCard(
                        title: state.postEntiti.data.children[index].data.title,
                        url: state
                            .postEntiti.data.children[index].data.thumbnail),
                  );
                },
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Spacer(),
                const Text(
                  'Reddit',
                  style: TextStyle(
                    color: Colors.black,
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
                const Spacer(),
              ],
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.grey[200],
          body: ListView.builder(
            itemCount: 25,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CardLoading(
                  cardLoadingTheme: CardLoadingTheme(
                    colorOne: Colors.white,
                    colorTwo: Color(0xfff5f5f5),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
