import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/routes.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: ManagerConestant.SplachTime), () {
      Navigator.pushReplacementNamed(context, Routes.outBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ManagerAssets.splash1,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Image.asset(
            ManagerAssets.splash2,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          Image.asset(
            ManagerAssets.splash3,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
