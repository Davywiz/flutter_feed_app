import 'package:flutter/material.dart';
import 'package:flutter_feed_app/gen/assets.gen.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class CreatePostBottomSheet extends StatelessWidget {
  const CreatePostBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ), // Adjust for keyboard

      child: Container(
        // Optional: give it rounded top corners
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          // SafeArea helps avoid system UI overlap
          child: Column(
            mainAxisSize: MainAxisSize.min, // Wrap content
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the sheet
                    },
                  ),
                ],
              ),

              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(Assets.images.imgProfile1.path),
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bruce Wayne',
                        style: const TextStyle(
                          color: AppColors.username,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        '@bruce',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(12),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: AppColors.lowLight,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Iconsax.edit_2,
                          color: AppColors.darkColor,
                          size: 28,
                        ),
                        Gap(10),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),

                              hintText: 'Write your post...',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),

                    const Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TappableIcon(icon: Icons.image_outlined, onTap: () {}),
                        Gap(10),
                        TappableIcon(icon: Iconsax.video, onTap: () {}),
                        Gap(10),
                        TappableIcon(
                          icon: Icons.gif_box_outlined,
                          onTap: () {},
                        ),
                        Gap(10),
                        TappableIcon(icon: Icons.list_outlined, onTap: () {}),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.background,
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(60, 33),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          onPressed: () {},
                          child: const Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TappableIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const TappableIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 20, color: AppColors.darkColor),
      ),
    );
  }
}
