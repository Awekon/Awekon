import 'dart:async';

import 'package:awekon/components/ui_components/BottomNavigation/Views/BottomNavigation.dart';
import 'package:awekon/components/ui_components/CustomButton/CustomGradientButton.dart';
import 'package:awekon/components/ui_components/Loading/Bloc/loading_manager.dart';
import 'package:awekon/components/ui_components/TextField/Views/CustomTextField.dart';
import 'package:awekon/config/size_config.dart';
import 'package:awekon/core/Theme/Theme.dart';
import 'package:awekon/core/constants/BottomNavigationItems.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late PageController _pageController;
  var _pageindex = 0;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _pageindex = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // List of parameters for CustomTextField
  List<Map<String, dynamic>> textFieldParams = [
    {
      'controller': TextEditingController(),
      'inputType': TextInputType.text,
      'icon': Icons.person,
      'hint': 'Full Name',
      'label': 'Full Name',
    },
    {
      'controller': TextEditingController(),
      'inputType': TextInputType.emailAddress,
      'icon': Icons.email,
      'hint': 'Email',
      'label': 'Email',
    },
    {
      'controller': TextEditingController(),
      'inputType': TextInputType.visiblePassword,
      'icon': Icons.lock,
      'hint': 'Password',
      'label': 'Password',
    },
  ];
  _navigateToHome() {
    LoadingManager.hideLoading(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return BottomNavigation(items: bottomNavigationItems);
    }));
  }

  signUpButtonFunction() {
    if (_pageindex < textFieldParams.length - 1) {
      _pageController.jumpToPage(_pageindex + 1);
    } else {
      LoadingManager.showLoading(context);
      Timer(const Duration(seconds: 2), _navigateToHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    var gradient = AppThemes.isDark(context)
        ? AppThemes.GRADIENT_DARK_BACKGROUND
        : AppThemes.GRADIENT_LIGHT_BACKGROUND;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: 55 * SizeConfig.blockSizeVertical,
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 7 * SizeConfig.blockSizeVertical,
                left: 9 * SizeConfig.blockSizeHorizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/icons/Awekon_shadow_icon.png"),
                  ),
                  SizedBox(
                    height: 2 * SizeConfig.blockSizeVertical,
                  ),
                  Text(
                    "Welcome,\nExplore and Enjoy!",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontFamily: 'primaryFont'),
                  ),
                  SizedBox(
                    height: 5 * SizeConfig.blockSizeVertical,
                  ),
                  Text(
                    "SignUp",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontFamily: 'primaryFont'),
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.blockSizeVertical,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(
              top: 40 * SizeConfig.blockSizeVertical,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10 * SizeConfig.blockSizeVertical),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10 * SizeConfig.blockSizeHorizontal, bottom: 5),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Enter Your ${textFieldParams[_pageindex]["hint"]}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontFamily: 'primaryFont'),
                          )),
                    ),
                    SizedBox(
                      height: 13 * SizeConfig.blockSizeVertical,
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: textFieldParams.length,
                        itemBuilder: (context, index) {
                          return CustomTextField(
                            controller: textFieldParams[index]['controller'],
                            inputType: textFieldParams[index]['inputType'],
                            icon: textFieldParams[index]['icon'],
                            hint: textFieldParams[index]['hint'],
                            label: textFieldParams[index]['label'],
                          );
                        },
                      ),
                    ),
                    Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 5 * SizeConfig.blockSizeHorizontal,
                          top: 2 * SizeConfig.blockSizeVertical,
                        ),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomGradientButton(
                              onPressed: signUpButtonFunction,
                              child: _pageindex == textFieldParams.length - 1
                                  ? const Icon(Icons.check_outlined)
                                  : const Icon(Icons.arrow_forward),
                            )),
                      ),
                      if (_pageindex != 0)
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5 * SizeConfig.blockSizeHorizontal,
                            top: 2 * SizeConfig.blockSizeVertical,
                          ),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomGradientButton(
                                onPressed: () {
                                  _pageController.jumpToPage(_pageindex - 1);
                                },
                                child: const Icon(Icons.arrow_back),
                              )),
                        ),
                    ]),
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have account?"),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              child:
                                  Image.asset("assets/icons/googleSignIn.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              child:
                                  Image.asset("assets/icons/appleSignIn.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              child: Image.asset("assets/icons/xSignIn.png")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
