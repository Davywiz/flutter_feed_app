# Flutter Feed App

This is a simple Flutter application demonstrating a social media feed with a search bar. It includes:
- Riverpod for state management
- Like button toggles
- Feed search functionality
- Viewing Feed Images functionality
- Widget tests
- GitHub Actions for CI

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Davywiz/flutter_feed_app.git
2. Navigate into the project directory:
    cd flutter_feed_app
3. Get dependencies:
    flutter pub get
4. Run the app:
    flutter run
5. Run tests:
    flutter test

## Architecture
Riverpod is used for state management due to its simplicity and testability.
The project is structured into features for clarity and scalability.

## Continuous Integration
 A GitHub Actions workflow (.github/workflows/flutter_test.yml) runs widget tests on each push/pull request to main.
The workflow fails if any test fails, ensuring code quality.

![Flutter CI](https://github.com/Davywiz/flutter_feed_app/workflows/Flutter%20CI/badge.svg)

## Demo Video
[Watch the demo](screenshots/demo_007.mp4)


## Screenshots

see /screenshots folder.

![Home Screen](screenshots/home_screen.png)

### Search Feature
![Search Feature](screenshots/search_feed.png)

![Other Images]
![Image](screenshots/action_bottom_sheet.png)
![Image](screenshots/add_post_bottom_sheet.jpg)
![Image](screenshots/bottom_nav_bar_toggle.png)
![Image](screenshots/liked_feed.png)
![Image](screenshots/swipe_image_post.png)
![Image](screenshots/view_image_post.png)
![Image](screenshots/view_one_image_post.png)
![Image](screenshots/viewing_four_image_post.png)
![Image](screenshots/viewing_post_image.png)
![Image](screenshots/viewing_three_images_post.png)
![Image](screenshots/no_posts_found.jpg)


