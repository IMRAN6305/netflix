import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/presentation/auth/pages/signin.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});

  final TextEditingController _emailcon = TextEditingController();
  final TextEditingController _passwordcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
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
            _signupButton(context),
            const SizedBox(
              height: 20,
            ),
            _signinText(context)
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _email() {
    return TextField(
      controller: _emailcon,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordcon,
      decoration: const InputDecoration(hintText: "Password"),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        // await SignupUsecase(
        //         authRepository:
        //             AuthRepositoryImpl(authApiService: AuthAPiServiceImpl()))
        //     .call(
        //         params: SignupReqParams(
        //   email: _emailcon.text,
        //   password: _passwordcon.text,
        // ));

        return await sl<SignupUsecase>().call(
          params: SignupReqParams(
            email: _emailcon.text,
            password: _passwordcon.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigation.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {},
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Do you have account?"),
      TextSpan(
        text: " Sign In ",
        style: const TextStyle(
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            AppNavigation.push(context, Signinpage());
          },
      )
    ]));
  }
}
