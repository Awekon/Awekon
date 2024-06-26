import 'package:awekon/components/ui_components/CustomButton/CustomGradientButton.dart';
import 'package:awekon/config/SharedPreference.dart';
import 'package:awekon/config/size_config.dart';
import 'package:awekon/core/constants/SystemNavigationConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  Future<void> _completeOnboarding() async {
    await SharedPreferencesHelper.setValue<bool>('onboardingCompleted', true);
    _navigateToHome();
  }

  void _navigateToHome() {
    Get.offAllNamed(singUpRoute);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                onPressed: _completeOnboarding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('SKIP',
                        style: theme.textTheme.titleMedium?.copyWith(
                            fontFamily: 'primaryFont',
                            fontWeight: FontWeight.w700)),
                    const SizedBox(width: 1),
                    const Icon(
                      Icons.skip_next,
                      size: 24.0,
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
                    child: CustomGradientButton(
                      onPressed: _completeOnboarding,
                      child: const Text("Continue"),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
