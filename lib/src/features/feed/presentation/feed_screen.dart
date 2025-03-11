import 'package:flutter/material.dart';
import 'package:flutter_feed_app/src/features/feed/widgets/top_app_bar.dart';
import 'package:gap/gap.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopAppBar(),
              Gap(10),
              Text(
                'Community',
                style: TextStyle(
                  color: Color(0xFF3E4047),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
