import 'package:awekon/components/ui_components/Loading/Views/Loading.dart';
import 'package:flutter/material.dart';

// class LoadingManager {
//   final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
//
//   void dispose() {
//     isLoading.dispose();
//   }
//
//   void showLoading(BuildContext context) {
//     isLoading.value = true;
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return ValueListenableBuilder<bool>(
//           valueListenable: isLoading,
//           builder: (context, value, child) {
//             if (value) {
//               return const Loading();
//             } else {
//               Navigator.of(context).pop();
//               return const SizedBox.shrink();
//             }
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> hideLoading() async {
//     isLoading.value = false;
//     await Future.delayed(const Duration(milliseconds: 20));
//   }
// }

class LoadingManager {
  static void showLoading(BuildContext context) {
    // isLoading.value = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Loading());
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
