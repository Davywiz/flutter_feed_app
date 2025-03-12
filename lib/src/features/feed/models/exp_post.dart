import 'package:flutter_feed_app/gen/assets.gen.dart';

import 'feed_post.dart';

final List<FeedPost> dummyPosts = [
  FeedPost(
    id: "1",
    userId: "@paulsunday",
    username: "Paul Adah",
    profileImageUrl: Assets.images.imgProfile2.path,
    content: "What is it like to study in Orlando?",
    imageUrls: [],
    likes: 4,
    comments: 2,
    retweetCount: 2,
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  FeedPost(
    id: "2",
    userId: "@paulsunday",
    username: "Paul Adah",
    profileImageUrl: Assets.images.imgProfile2.path,
    content: "Paul Adah just got a new laptop, hehe.",
    imageUrls: [Assets.images.imgPost8.path, Assets.images.imgPost8.path],
    likes: 89,
    comments: 4,
    retweetCount: 9,
    timestamp: DateTime.now().subtract(const Duration(hours: 1)),
  ),

  FeedPost(
    id: "3",
    userId: "@vickyjames",
    username: "Victor James",
    profileImageUrl: Assets.images.imgProfile3.path,
    content: "Nature and Beauty.",
    imageUrls: [
      Assets.images.imgPost1.path,
      Assets.images.imgPost2.path,
      Assets.images.imgPost3.path,
    ],
    likes: 18,
    comments: 8,
    retweetCount: 8,
    timestamp: DateTime.now().subtract(const Duration(hours: 4)),
  ),

  FeedPost(
    id: "4",
    userId: "@blake",
    username: "Blake Lively",
    profileImageUrl: Assets.images.imgProfile4.path,
    content: "The beauty that is football.",
    imageUrls: [
      Assets.images.imgPost9.path,
      Assets.images.imgPost10.path,
      Assets.images.imgPost11.path,
      Assets.images.imgPost12.path,
    ],
    likes: 11,
    comments: 8,
    retweetCount: 5,
    timestamp: DateTime.now().subtract(const Duration(hours: 8)),
  ),
  FeedPost(
    id: "5",
    userId: "@jonsnow",
    username: "Jon Snow",
    profileImageUrl: Assets.images.imgProfile4.path,
    content:
        "A dream doesn't become reality through magic; it takes sweat, determination and hard work",
    imageUrls: [Assets.images.imgPost7.path],
    likes: 29,
    comments: 3,
    retweetCount: 2,
    timestamp: DateTime.now().subtract(const Duration(hours: 10)),
  ),
];
