import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram/constant/post_json.dart';
import 'package:instagram/constant/story_json.dart';
import 'package:instagram/theme/colors.dart';
import 'package:instagram/widgets/post_item.dart';
import 'package:instagram/widgets/story_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: getAppBar(),
        bottomNavigationBar: getBottomNavBar(),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 12),
                        child: Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(profile),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 19,
                                      height: 19,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: const Icon(Icons.add_circle,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                "${name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(stories.length, (index) {
                          return Story(
                            img: stories[index]['img'],
                            name: stories[index]['name'],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white.withOpacity(0.3),
                ),
                Column(
                  children: List.generate(post.length, (index) {
                    return Post(
                      postImg: post[index]['postImg'],
                      profileImg: post[index]['profileImg'],
                      name: post[index]['name'],
                      viewCount: post[index]['commentCount'],
                      isLoved: post[index]['isLoved'],
                      likeBy: post[index]['likeBy'],
                      dayAgo: post[index]['timeAgo'],
                      caption: post[index]['caption'],
                    );
                  }),
                )
              ],
            )));
  }
}

AppBar getAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: appBarColor,
    centerTitle: true,
    title: const Text(
      "Instagram",
      style: TextStyle(fontSize: 35, fontFamily: 'Billabong'),
    ),
    leading: const Icon(
      Icons.camera_enhance_rounded,
      color: Colors.white,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(Icons.send),
      )
    ],
  );
}

Widget getBottomNavBar() {
  return Container(
    color: Colors.black,
    height: 50,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.explore_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outlined,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
