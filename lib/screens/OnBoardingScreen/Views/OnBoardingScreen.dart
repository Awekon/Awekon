import 'package:awekon/components/ui_components/BottomNavigation/Views/BottomNavigation.dart';
import 'package:awekon/config/size_config.dart';
import 'package:awekon/core/constants/BottomNavigationItems.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

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
          'Explore virtual world and deep dive into it by watching your favorite video in VR!',
      'image': 'assets/images/onboarding1.jpeg',
    },
    {
      'title': 'Discover',
      'description': 'Discover new features and possibilities with our app.',
      'image': 'assets/images/onboarding2.jpeg',
    },
    {
      'title': 'Get Started',
      'description': 'Let\'s get started and explore the app.',
      'image': 'assets/images/onboarding1.jpeg',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            onboardingData[index]['image']!,
                            height: 50 * SizeConfig.blockSizeVertical,
                            width: 96 * SizeConfig.blockSizeHorizontal,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            onboardingData[index]['title']!,
                            style: theme.textTheme.displayLarge,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              onboardingData[index]['description']!,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: const WormEffect(
                    activeDotColor: Colors.redAccent,
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
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                ),
                onPressed: navigate,
              ),
            ),
            if (currentIndex == onboardingData.length - 1)
              Positioned(
                bottom: 30.0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30),
                  child: ElevatedButton(
                    onPressed: navigate,
                    child: const Text('Continue'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
