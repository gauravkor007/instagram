import 'package:flutter/material.dart';
import 'package:instagram/theme/colors.dart';

class Post extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final bool isLoved;
  final String likeBy;
  final String viewCount;
  final String dayAgo;

  const Post(
      {Key? key,
      required this.profileImg,
      required this.name,
      required this.postImg,
      required this.caption,
      required this.isLoved,
      required this.likeBy,
      required this.viewCount,
      required this.dayAgo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(profileImg), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(postImg), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 3,
          ),
          child: Row(
            children: [
              isLoved
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 26,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.messenger_outline_outlined,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.send,
                color: Colors.white,
                size: 26,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Liked by ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "${likeBy}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const TextSpan(
                  text: "and",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(
                  text: "others",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: RichText(
            text: TextSpan(children: [
              const TextSpan(
                text: "$name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(
                text: "$caption",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Text(
            "view $viewCount comments",
            style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
