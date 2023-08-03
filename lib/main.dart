import 'package:flutter/material.dart';
import 'package:shop_avatar/core/routes.dart';
import 'package:shop_avatar/features/out_boarding/out_boarding_screen.dart';
import 'package:shop_avatar/features/splach/presentation/splach_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splachScreen,
      routes: {
        Routes.splachScreen: (context) => SplachScreen(),
        Routes.outBoarding: (context) => OutBoarding(),
      },
    );
  }
}
