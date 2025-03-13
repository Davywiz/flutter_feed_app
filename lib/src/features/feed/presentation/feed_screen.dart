import 'package:flutter/material.dart';
import 'package:flutter_feed_app/src/features/feed/dialogs/add_post_dialog.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/bottom_navigation_bar.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/feed_list.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import '../state/feed_post_provider.dart';
import '../widgets/feed_search_bar.dart';

import '../widgets/top_app_bar.dart';
import 'package:gap/gap.dart';

class FeedScreen extends HookConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = useTextEditingController();
    final searchQueryText = useState('');

    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            ),
            builder: (BuildContext context) {
              return const CreatePostBottomSheet();
            },
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Iconsax.edit, color: Colors.white, size: 28),
      ),

      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopAppBar(),
              const Gap(10),
              const Text(
                'Community',
                style: TextStyle(
                  color: Color(0xFF3E4047),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(5),
              FeedSearchBar(
                controller: searchTextController,
                searchQueryText: searchQueryText,
                onSearch: (query) {
                  ref.read(feedProvider.notifier).searchPosts(query);
                },
              ),
              const Gap(8),
              Expanded(child: FeedList()),
            ],
          ),
        ),
      ),
    );
  }
}
