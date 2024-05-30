import 'package:awekon/components/ui_components/Loading/Loading.dart';
import 'package:flutter/material.dart';

class LoadingManager {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void dispose() {
    isLoading.dispose();
  }

  void showLoading(BuildContext context) {
    isLoading.value = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, value, child) {
            if (value) {
              return const Loading();
            } else {
              Future.delayed(const Duration(milliseconds: 100), () {
                Navigator.of(context).pop();
              });
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  void hideLoading() {
    isLoading.value = false;
  }
}
