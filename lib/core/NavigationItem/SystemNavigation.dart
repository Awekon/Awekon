import 'package:awekon/components/ui_components/BottomNavigation/Views/BottomNavigation.dart';
import 'package:awekon/core/constants/BottomNavigationItems.dart';
import 'package:awekon/core/constants/SystemNavigationConstant.dart';
import 'package:awekon/screens/Profile/Views/ProfilePage.dart';
import 'package:awekon/screens/SignUp/Views/SignUp.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

List<GetPage> getSystemPages = [
  GetPage(
      name: homeActivityRoute,
      page: () => BottomNavigation(items: bottomNavigationItems),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: profileRoute,
      page: () => const ProfilePage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: singUpRoute,
      page: () => const SignUp(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200)),
];
