import 'package:flutter/material.dart';
import 'package:flutter_feed_app/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/feed/presentation/feed_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Feed App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFAFAFA),
        primaryColor: AppColors.primaryColor,

        // Google Fonts configuration
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          Theme.of(context).textTheme.copyWith(
            bodyMedium: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            titleLarge: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            displaySmall: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            headlineSmall: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // For components that don't use textTheme directly
        typography: Typography.material2021().copyWith(
          black: Typography.material2021().black.merge(
            GoogleFonts.spaceGroteskTextTheme(),
          ),
          white: Typography.material2021().white.merge(
            GoogleFonts.spaceGroteskTextTheme(),
          ),
        ),
      ),
      home: const FeedScreen(),
    );
  }
}
