import 'package:awekon/components/ui_components/TextField/CustomTextField.dart';
import 'package:awekon/config/size_config.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(94, 18, 8, 1), // rgba(94,18,8,1)
                  Color.fromRGBO(115, 101, 82, 1), // rgba(115,101,82,1)
                ],
                stops: [0.26, 0.66],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
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
                    height: 6 * SizeConfig.blockSizeVertical,
                  ),
                  Text(
                    "SignUp",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontFamily: 'primaryFont'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
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
            child: Expanded(
              flex: 3,
              child: Column(
                children: [
                  PageView.builder(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
