import 'package:flutter/material.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class HomeSwitcher extends HookWidget {
  const HomeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = useState(0);

    Widget buildSwitcherButton(int index, IconData icon) {
      final isSelected = selected.value == index;
      return GestureDetector(
        onTap: () => selected.value = index,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF3684F3) : Colors.transparent,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: AppColors.lowLight,
        borderRadius: BorderRadius.circular(96),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSwitcherButton(0, Iconsax.home),
          const Gap(6),
          buildSwitcherButton(1, Iconsax.messages_2),
        ],
      ),
    );
  }
}
