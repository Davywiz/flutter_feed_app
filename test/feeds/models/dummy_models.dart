import 'package:flutter_feed_app/gen/assets.gen.dart';
import 'package:flutter_feed_app/src/features/feed/models/feed_post.dart';

final dummyFeedModel = [
  FeedPost(
    id: "1",
    userId: "@grey",
    username: "Grey Wat",
    profileImageUrl: Assets.images.imgProfile2.path,
    content: "First post",
    imageUrls: [],
    likes: 0,
    comments: 2,
    retweetCount: 2,
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  FeedPost(
    id: "2",
    userId: "@paulsunday",
    username: "Paul Adah",
    profileImageUrl: Assets.images.imgProfile2.path,
    content: "Second post",
    imageUrls: [Assets.images.imgPost8.path, Assets.images.imgPost8.path],
    likes: 5,
    comments: 4,
    retweetCount: 9,
    timestamp: DateTime.now().subtract(const Duration(hours: 1)),
  ),
];
