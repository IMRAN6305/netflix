import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/configs/theme/app_theme.dart';
import 'package:netflix/presentation/splash/bloc/splash_cubit.dart';
import 'package:netflix/presentation/splash/pages/splash.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => SplashCubit()..appStarted(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage());
  }
}
