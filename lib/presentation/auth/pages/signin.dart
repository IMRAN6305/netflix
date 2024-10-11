import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';

class Signinpage extends StatelessWidget {
  const Signinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(
              height: 30,
            ),
            _email(),
            const SizedBox(
              height: 20,
            ),
            _password(),
            const SizedBox(
              height: 20,
            ),
            _signinButton(),
            const SizedBox(
              height: 20,
            ),
            _signupText(context)
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _email() {
    return const TextField(
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _password() {
    return const TextField(
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't you have account?"),
      TextSpan(
        text: " Sign Up ",
        style: const TextStyle(
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            AppNavigation.push(context, const Signuppage());
          },
      )
    ]));
  }
}
