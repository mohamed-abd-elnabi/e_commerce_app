import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text('Cart'.toUpperCase(),
            style: getBoldTextStyle(fontSize: 20, color: ManagerColors.blake)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
            margin: const EdgeInsetsDirectional.symmetric(
                vertical: 28, horizontal: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ManagerHeight.h20,
                    ),
                    Text(
                      'Accessories ',
                      style: getRegularTextStyle(
                          fontSize: 22, color: ManagerColors.blake),
                    ),
                    SizedBox(
                      height: ManagerHeight.h24,
                    ),
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
