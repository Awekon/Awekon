import 'package:awekon/components/ui_components/Custom%20Card/Views/CustomCard.dart';
import 'package:awekon/components/ui_components/Loading/Bloc/loading_manager.dart';
import 'package:awekon/core/constants/font_size.dart';
import 'package:awekon/screens/SignUp/SignUp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/ui_components/Trending Carousel/Views/carousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LoadingManager _loadingManager = LoadingManager();

  @override
  void dispose() {
    _loadingManager.dispose();
    super.dispose();
  }

  Future<void> _performApiCall() async {
    _loadingManager.showLoading(context);

    try {
      // Simulate an API call with a delay
      await Future.delayed(const Duration(seconds: 3));

      // Perform your actual API call here
      // final response = await yourApiCall();

      if (kDebugMode) {
        print("API call finished");
      }
    } catch (error) {
      if (kDebugMode) {
        print("API call error: $error");
      }
    } finally {
      _loadingManager.hideLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(child: TrendingCarousel()),
            const Center(
              child: Text(
                "Home",
                style: TextStyle(fontSize: FontSize.large),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text("Go To Signup"),
            ),
            CustomCard(),
          ],
        ),
      ),
    );
  }

  void profileIconPressed() {
    if (kDebugMode) {
      print("pressed on icon");
    }
  }
}
