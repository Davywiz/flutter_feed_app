import 'package:flutter/material.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ActionsBottomSheet extends StatelessWidget {
  const ActionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Text(
              "Actions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Gap(24),
            const _ActionItem(
              icon: Icons.notifications_off_outlined,
              text: 'Notify Me',
            ),
            const _ActionItem(icon: Iconsax.edit_2, text: 'Edit Post'),
            const _ActionItem(icon: Iconsax.flag, text: 'Flag Post'),
          ],
        ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ActionItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(bottom: 8),
        leading: Icon(icon, size: 24, color: AppColors.darkColor),
        splashColor: AppColors.lowLight,
        onTap: () {},
        title: Text(
          text,
          style: const TextStyle(
            color: AppColors.darkColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              child: const VerticalDivider(
                color: AppColors.lowLight,
                thickness: 1,
              ),
            ),
            const Gap(10),
            const Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: AppColors.darkColor,
            ),
          ],
        ),
      ),
    );
  }
}
