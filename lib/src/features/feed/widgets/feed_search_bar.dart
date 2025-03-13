import 'package:flutter/material.dart';
import 'package:flutter_feed_app/styles/colors.dart';

class FeedSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<String> searchQueryText;
  final Function(String) onSearch;

  const FeedSearchBar({
    required this.controller,
    required this.searchQueryText,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xFF0A0D14),
        height: 1,
        fontSize: 15,
      ),
      onChanged: (val) {
        searchQueryText.value = val;
        onSearch(val);
      },
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Search feeds",
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(0xFF6E7178),
          fontSize: 14,
        ),
        suffix:
            searchQueryText.value.isNotEmpty
                ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.clear();
                    searchQueryText.value = '';
                    onSearch('');
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lowLight,
                    ),
                    child: const Icon(Icons.clear, size: 16),
                  ),
                )
                : null,
        filled: true,
        fillColor:
            searchQueryText.value.isEmpty
                ? Colors.white.withOpacity(0.04)
                : const Color(0x84E2E4E8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFE2E4E8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFFE2E4E8)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13.5,
        ),
      ),
    );
  }
}
