import 'package:flutter/material.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/feed_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutter_feed_app/src/features/feed/state/feed_post_provider.dart';

import '../models/dummy_models.dart';

void main() {
  testWidgets('Tapping like button updates like count', (tester) async {
    await tester.runAsync(() async {
      final container = ProviderContainer();

      try {
        // Override the notifier's state
        container.read(feedNotifierProvider.notifier).state = [
          dummyFeedModel.first,
        ];

        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: const MaterialApp(home: Scaffold(body: FeedList())),
          ),
        );

        // Initial state
        expect(find.text('0'), findsOneWidget);
        expect(find.byIcon(Iconsax.heart), findsOneWidget);

        // First tap
        await tester.tap(find.byIcon(Iconsax.heart));
        await tester.pump(); // Single pump instead of pumpAndSettle
        expect(find.text('1'), findsOneWidget);

        // Second tap
        await tester.tap(find.byIcon(Iconsax.heart5));
        await tester.pump();
        expect(find.text('0'), findsOneWidget);
      } finally {
        container.dispose();
      }
    });
  });

  group('Interacting with two posts', () {
    testWidgets('verifying one post change does not affect the other', (
      tester,
    ) async {
      await tester.runAsync(() async {
        final container = ProviderContainer();

        try {
          // Override the notifier's state
          container.read(feedNotifierProvider.notifier).state = dummyFeedModel;

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(home: Scaffold(body: FeedList())),
            ),
          );

          // Verify both posts are rendered
          expect(find.text('First post'), findsOneWidget);
          expect(find.text('Second post'), findsOneWidget);

          //Test first post
          final firstPostLikeButton = find.descendant(
            of: find.ancestor(
              of: find.text('First post'),
              matching: find.byType(
                Padding,
              ), // Adjust to your post container type
            ),
            matching: find.byIcon(Iconsax.heart),
          );

          await tester.tap(firstPostLikeButton);
          await tester.pump();
          expect(find.text('1'), findsOneWidget); // First post updated
          expect(find.text('5'), findsOneWidget); // Second post remains
        } finally {
          container.dispose();
        }
      });
    });

    testWidgets('Like and Unlike a Feed Post', (tester) async {
      await tester.runAsync(() async {
        final container = ProviderContainer();

        try {
          // Override the notifier's state
          container.read(feedNotifierProvider.notifier).state = dummyFeedModel;

          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const MaterialApp(home: Scaffold(body: FeedList())),
            ),
          );

          // Verify both posts are rendered
          expect(find.text('First post'), findsOneWidget);
          expect(find.text('Second post'), findsOneWidget);
          expect(find.text('0'), findsOneWidget);
          expect(find.text('5'), findsOneWidget);

          //Test first post
          final firstPostLikeButton = find.descendant(
            of: find.ancestor(
              of: find.text('First post'),
              matching: find.byType(
                Padding,
              ), // Adjust to your post container type
            ),
            matching: find.byIcon(Iconsax.heart),
          );

          await tester.tap(firstPostLikeButton);
          await tester.pumpAndSettle();
          expect(find.text('1'), findsOneWidget); // First post updated

          final unlikePostLikeButton = find.descendant(
            of: find.ancestor(
              of: find.text('First post'),
              matching: find.byType(
                Padding,
              ), // Adjust to your post container type
            ),
            matching: find.byIcon(Iconsax.heart5),
          );
          await tester.tap(unlikePostLikeButton);
          await tester.pumpAndSettle();
          expect(find.text('0'), findsOneWidget);
        } finally {
          container.dispose();
        }
      });
    });
  });
}
