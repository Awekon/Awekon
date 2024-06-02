import 'package:awekon/components/ui_components/BottomNavigation/Views/BottomNavigation.dart';
import 'package:awekon/config/size_config.dart';
import 'package:awekon/core/constants/BottomNavigationItems.dart';
import 'package:awekon/core/constants/font_size.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome',
      'description':
          'Immerse yourself in a virtual world and experience the thrill of your favorite videos in stunning VR!',
      'image': 'assets/images/onboarding1.jpeg',
    },
    {
      'title': 'Discover',
      'description':
          'Uncover endless possibilities and discover any video you desire with our feature-rich app',
      'image': 'assets/images/onboarding2.jpeg',
    },
    {
      'title': 'Get Started',
      'description': 'Let\'s get started and explore the app.',
      'image': 'assets/images/onboarding3.jpeg',
    },
  ];

  void navigate() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavigation(items: bottomNavigationItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 9 * SizeConfig.blockSizeVertical),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              onboardingData[index]['image']!,
                              height: 50 * SizeConfig.blockSizeVertical,
                              width: 96 * SizeConfig.blockSizeHorizontal,
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    onboardingData[index]['title']!,
                                    style:
                                        theme.textTheme.displayLarge?.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    onboardingData[index]['description']!,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.headlineMedium
                                        ?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: WormEffect(
                    activeDotColor: theme.hintColor,
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: TextButton(
                onPressed: navigate,
                child: Row(
                  children: [
                    Text('Skip', style: theme.textTheme.displayMedium),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.skip_next,
                      size: 24.0,
                      color: theme.iconTheme.color,
                    ),
                  ],
                ),
              ),
            ),
            if (currentIndex == onboardingData.length - 1)
              Positioned(
                bottom: 30.0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5 * SizeConfig.blockSizeHorizontal,
                      vertical: 10 * SizeConfig.blockSizeVertical),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 1.5 * SizeConfig.blockSizeVertical),
                    ),
                    onPressed: navigate,
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: FontSize.medium),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
