import 'package:flutter/material.dart';
import 'package:flutter_feed_app/src/features/feed/dialogs/actions_dialog.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/feed_post_item.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../models/feed_post.dart';
import '../state/feed_post_provider.dart';

class FeedList extends ConsumerWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedPosts = ref.watch(feedProvider);

    if (feedPosts.isEmpty) {
      return const Center(child: Text("No posts found"));
    }

    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.only(top: 16),
      itemCount: feedPosts.length,
      itemBuilder:
          (context, index) => FeedPostItem(post: feedPosts[index], ref: ref),
    );
  }
}

class PostHeader extends StatelessWidget {
  final FeedPost post;

  const PostHeader({super.key, required this.post});

  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final postDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (postDate == today) {
      return DateFormat('hh:mm a').format(timestamp);
    } else {
      return DateFormat('dd MMM').format(timestamp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(post.profileImageUrl),
        ),
        const Gap(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.username,
              style: const TextStyle(
                color: AppColors.username,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(4),
            Text(
              post.userId,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 9,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          formatTimestamp(post.timestamp),
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(8),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              builder: (BuildContext context) {
                return const ActionsBottomSheet();
              },
            );
          },
          child: const Icon(
            Icons.more_horiz_sharp,
            color: AppColors.iconColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class PostActions extends StatelessWidget {
  final FeedPost post;
  final WidgetRef ref;

  const PostActions({super.key, required this.post, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(icon: Iconsax.messages_2, count: post.comments),
        const Gap(20),
        GestureDetector(
          onTap: () => ref.read(feedProvider.notifier).toggleLike(post.id),
          child: ActionButton(
            icon: post.isLiked ? Iconsax.heart5 : Iconsax.heart,
            count: post.likes,
            color: post.isLiked ? AppColors.liked : AppColors.textPrimary,
          ),
        ),
        const Gap(20),
        ActionButton(icon: Iconsax.repeat, count: post.retweetCount),
        const Gap(20),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color? color;

  const ActionButton({
    super.key,
    required this.icon,
    required this.count,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color ?? AppColors.textPrimary),
        const Gap(4),
        Text(
          '$count',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
