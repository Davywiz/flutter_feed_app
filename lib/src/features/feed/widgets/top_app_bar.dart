import 'package:flutter/material.dart';
import 'package:flutter_feed_app/gen/assets.gen.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/home_switcher.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightGreen, width: 2),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(Assets.images.imgProfile1.path),
          ),
        ),
        Gap(8),
        HomeSwitcher(),
        Spacer(),
        Assets.svg.topAppBarContainer.svg(width: 32, height: 32),
        Gap(8),
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.lowLight,
          child: Stack(
            clipBehavior: Clip.none, // Ensures the badge isn't clipped
            children: [
              Icon(Iconsax.notification, color: AppColors.darkColor, size: 20),
              Positioned(
                right: -10,
                top: -10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ), // Ensures a circular badge
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4C49),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '3',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
