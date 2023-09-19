import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ManagerAssets.logoApp,
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
