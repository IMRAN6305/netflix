import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/configs/assets/app_images.dart';
import 'package:netflix/presentation/splash/bloc/splash_cubit.dart';
import 'package:netflix/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit,SplashState>(
        listener: (context, state) {
          if(state is UnAuthenticated){

          }
          if(state is Authenticated){

          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff1A1B20).withOpacity(0),
                    const Color(0xff1A1B20)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
