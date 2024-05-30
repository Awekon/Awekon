import 'package:awekon/components/ui_components/Loading/loading_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awekon/constants/font_size.dart';

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
      await Future.delayed(const Duration(seconds: 5));

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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            icon: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://source.unsplash.com/50x50/?portrait',
              ),
            ),
            onPressed: profileIconPressed,
          ),
        ),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: FontSize.medium),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Home",
              style: TextStyle(fontSize: FontSize.large),
            ),
          ),
          ElevatedButton(
            onPressed: _performApiCall,
            child: const Text("Load"),
          ),
        ],
      ),
    );
  }

  void profileIconPressed() {
    if (kDebugMode) {
      print("pressed on icon");
    }
  }
}
