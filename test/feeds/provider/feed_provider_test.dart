import 'package:flutter_feed_app/src/features/feed/models/exp_post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutter_feed_app/src/features/feed/state/feed_post_provider.dart';

import '../models/dummy_models.dart';

void main() {
  test('FeedNotifier toggles like correctly', () {
    // Create a ProviderContainer with the original FeedNotifier
    final container = ProviderContainer();

    // Obtain the notifier
    final notifier = container.read(feedNotifierProvider.notifier);

    // Set up initial state
    notifier.state = dummyFeedModel;

    // Verify the number of feed
    expect(container.read(feedNotifierProvider).length, 2);
    // Simulate toggling a like for first feed
    notifier.toggleLike('1');

    // Verify the like state was updated correctly
    expect(container.read(feedNotifierProvider).first.likes, 1);
  });

  test('searchPosts with empty query restores original posts', () {
    final container = ProviderContainer();
    final notifier = container.read(feedNotifierProvider.notifier);

    // Perform a search to alter the state
    notifier.searchPosts('blake');
    expect(container.read(feedNotifierProvider).length, 1);

    // Clear the search
    notifier.searchPosts('');

    expect(container.read(feedNotifierProvider), dummyPosts);
  });

  test('searchPosts with no matches returns empty list', () {
    final container = ProviderContainer();
    final notifier = container.read(feedNotifierProvider.notifier);

    notifier.searchPosts('xyz');
    expect(container.read(feedNotifierProvider).isEmpty, true);
  });

  test('searchPosts is case insensitive', () {
    final container = ProviderContainer();
    final notifier = container.read(feedNotifierProvider.notifier);

    notifier.searchPosts('bLAke');
    expect(container.read(feedNotifierProvider), [dummyPosts[3]]);
  });

  test('toggleLike updates state correctly during and after search', () {
    final container = ProviderContainer();
    final notifier = container.read(feedNotifierProvider.notifier);

    // Search for post 2 and toggle like
    notifier.searchPosts('blake');
    notifier.toggleLike('4');
    expect(container.read(feedNotifierProvider).first.likes, 12);

    // Clear search and verify original list updated
    notifier.searchPosts('');
    expect(container.read(feedNotifierProvider)[3].likes, 12);

    // Toggle like on post not in previous search
    notifier.toggleLike('1');
    expect(container.read(feedNotifierProvider)[0].likes, 5);
  });
}
