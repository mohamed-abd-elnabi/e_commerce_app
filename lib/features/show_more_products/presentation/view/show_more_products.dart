import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller.dart';
import '../../../../core/constants.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_text_styles.dart';
import '../../../../core/resources/manager_weight.dart';
import '../../../home/presentation/model/home_model.dart';

class ShowMoreProducts extends StatelessWidget {
  const ShowMoreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      appBar: AppBar(
        backgroundColor: ManagerColors.transparent,
        elevation: ManagerConestant.elevationAppbar,
        title: Text(
          'Products'.toUpperCase(),
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s18,
          ),
        ),
        centerTitle: true,
        actions: [
          Image.asset(height: 24, 'assets/images/more_products/menu.png'),
          SizedBox(
            width: ManagerWeight.w16,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ManagerColors.white,
              borderRadius: BorderRadius.circular(
                ManagerRaduis.r100,
              ),
            ),
            margin: EdgeInsetsDirectional.only(
              end: ManagerWeight.w20,
              top: ManagerHeight.h4,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                SizedBox(width: ManagerWeight.w16),
                Expanded(
                  child: Text(
                    'search',
                    style: getMediumTextStyle(
                      color: ManagerColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ManagerHeight.h20),
          SingleChildScrollView(
            child: GetBuilder<HomeController>(builder: (controller) {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
                width: ManagerWeight.w320,
                alignment: Alignment.center,
                margin: EdgeInsetsDirectional.only(
                  end: ManagerWeight.w12,
                ),
                child: GridView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    HomeModelData homeDataModel =
                        controller.homeModel.data[index];
                    return InkWell(
                      onTap: () {
                        controller.productDetails(context, homeDataModel.id);
                      },
                      child: LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    ManagerRaduis.r10,
                                  ),
                                  child: controller.image(
                                    courseAvatar:
                                        homeDataModel.thumbnailImage.toString(),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      homeDataModel.name,
                                      style: getMediumTextStyle(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      controller.productPrice(
                                          homeDataModel.basePrice.toString(),
                                          homeDataModel.unit),
                                      style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s12,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  },
                  itemCount: controller.homeModel.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: ManagerWeight.w10,
                    mainAxisSpacing: ManagerHeight.h10,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
