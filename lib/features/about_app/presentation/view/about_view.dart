import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_text_styles_light.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        title: Text('About'.toUpperCase(),
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
          Image.asset('assets/images/splach/mmm.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'New4Shop',
            style: getBoldTextStyle(fontSize: 22, color: ManagerColors.blake),
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
                      'About Us',
                      style: getBoldTextStyle(
                          fontSize: 22, color: ManagerColors.blake),
                    ),
                    SizedBox(
                      height: ManagerHeight.h24,
                    ),
                    Text(
                      '''Voluptates tempora tempora fugiat quidem delectus rerum. Libero et velit earum. Minus quia ab eligendi blanditiis harum sint laborum omnis. Nulla fugiat sapiente explicabo quisquam dolor excepturi.

Repudiandae alias quo ut. Quos non id. Sit quos maiores ad voluptatem aliquid. Blanditiis numquam aspernatur et.

A rerum tenetur. Vero in aut molestias labore et vel illum ut. Voluptatibus consequatur consequatur non. Dolorum aliquam eum rem natus. Aperiam possimus consequatur voluptates omnis. Ipsa non ad fugiat illum est deleniti perspiciatis id.

At consequuntur at dolorem cum rerum sit accusantium. Atque deleniti ratione est reprehenderit vero voluptatum magni aut. Et id fuga. Magnam quod omnis ut cupiditate et maiores quisquam ut.

Praesentium vel officiis est voluptatem quam voluptates incidunt. Totam nemo sapiente veniam cum alias. Facere odio nobis quo corrupti accusamus. Ratione voluptate facere quaerat quia.''',
                      style: getRegularTextStyle(
                          fontSize: 16, color: ManagerColors.grey),
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
