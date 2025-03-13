import 'package:flutter/material.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavigationBar extends HookWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getChildren(selectedIndex),
      ),
    );
  }

  List<Widget> _getChildren(ValueNotifier<int> selectedIndex) {
    if (selectedIndex.value == 0) {
      return [
        _buildNavItem(
          index: 0,
          selectedIndex: selectedIndex,
          hasBackground: true,
        ),
        _buildGroupContainer([1, 2], true, selectedIndex),
      ];
    } else if (selectedIndex.value == 2) {
      return [
        _buildGroupContainer([0, 1], false, selectedIndex),
        _buildNavItem(
          index: 2,
          selectedIndex: selectedIndex,
          hasBackground: true,
        ),
      ];
    } else {
      return [0, 1, 2].map((index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _buildNavItem(
            index: index,
            selectedIndex: selectedIndex,
            hasBackground: true,
          ),
        );
      }).toList();
    }
  }

  Widget _buildGroupContainer(
    List<int> indices,
    bool isRight,
    ValueNotifier<int> selectedIndex,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.lowLight,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children:
            indices.map((index) {
              return _buildNavItem(
                index: index,
                selectedIndex: selectedIndex,
                hasBackground: false,
              );
            }).toList(),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required ValueNotifier<int> selectedIndex,
    required bool hasBackground,
  }) {
    final isSelected = selectedIndex.value == index;
    final isCenterSelected = selectedIndex.value == 1;
    final icon = _getIcon(index);
    final label = _getLabel(index);

    return GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: AnimatedContainer(
        width: 70,
        height: 70,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: hasBackground ? AppColors.lowLight : Colors.transparent,
          borderRadius:
              (isSelected || isCenterSelected)
                  ? null
                  : const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
          shape:
              (isSelected || isCenterSelected)
                  ? BoxShape.circle
                  : BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? AppColors.darkColor : AppColors.iconColor,
            ),
            const Gap(4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.darkColor : AppColors.iconColor,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Iconsax.home4;
      case 1:
        return Icons.history;
      case 2:
        return Icons.grid_view_outlined;
      default:
        return Icons.error;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'History';
      case 2:
        return 'More';
      default:
        return '';
    }
  }
}
