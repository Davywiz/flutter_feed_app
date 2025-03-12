import 'package:flutter_feed_app/src/features/feed/models/exp_post.dart';
import 'package:flutter_feed_app/src/features/feed/models/feed_post.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final feedProvider = StateNotifierProvider<FeedNotifier, List<FeedPost>>((ref) {
  return FeedNotifier();
});

class FeedNotifier extends StateNotifier<List<FeedPost>> {
  final List<FeedPost> _originalPosts = List.from(dummyPosts);

  FeedNotifier() : super(dummyPosts);

  void toggleLike(String postId) {
    // Update original list
    for (var i = 0; i < _originalPosts.length; i++) {
      if (_originalPosts[i].id == postId) {
        _originalPosts[i] = _originalPosts[i].toggleLike();
        break;
      }
    }

    // Update displayed state list
    state =
        state.map((post) {
          if (post.id == postId) {
            return post.toggleLike();
          }
          return post;
        }).toList();
  }

  void searchPosts(String query) {
    if (query.isEmpty) {
      state = List.from(_originalPosts); // Restore original list
    } else {
      state =
          _originalPosts
              .where(
                (post) =>
                    post.username.toLowerCase().contains(query.toLowerCase()) ||
                    post.content.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
  }
}
