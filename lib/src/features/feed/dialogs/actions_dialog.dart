import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActionsBottomSheet extends StatelessWidget {
  const ActionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Optional: give it rounded top corners
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        // SafeArea helps avoid system UI overlap
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Text(
              "Actions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Gap(30),
          ],
        ),
      ),
    );
  }
}
