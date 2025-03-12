import 'package:flutter/material.dart';
import 'package:flutter_feed_app/src/features/feed/models/feed_post.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/feed_list.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageScreen extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const ImageScreen({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Image(
              image: AssetImage(widget.imageUrls[index]),
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class FeedPostItem extends StatelessWidget {
  final FeedPost post;
  final WidgetRef ref;

  const FeedPostItem({super.key, required this.post, required this.ref});

  void _openImageScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                ImageScreen(imageUrls: post.imageUrls, initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildImageGrid() {
      final images = post.imageUrls;
      final count = images.length;

      if (count == 1) {
        return GestureDetector(
          onTap: () => _openImageScreen(context, 0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(image: AssetImage(images[0]), fit: BoxFit.cover),
            ),
          ),
        );
      } else if (count == 3) {
        return SizedBox(
          height: 218,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => _openImageScreen(context, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: AssetImage(images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Gap(4),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _openImageScreen(context, 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: AssetImage(images[1]),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const Gap(6),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _openImageScreen(context, 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: AssetImage(images[2]),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemCount: images.length > 4 ? 4 : images.length,
          itemBuilder:
              (context, index) => GestureDetector(
                onTap: () => _openImageScreen(context, index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(width: 1, color: AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PostHeader(post: post),
            const Gap(16),
            Text(
              post.content,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(16),
            post.imageUrls.isEmpty
                ? const SizedBox.shrink()
                : Column(children: [buildImageGrid(), const Gap(16)]),

            PostActions(post: post, ref: ref),
          ],
        ),
      ),
    );
  }
}
