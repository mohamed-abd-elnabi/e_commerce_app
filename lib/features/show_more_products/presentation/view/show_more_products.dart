import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/widegts/base_button.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller.dart';
import '../../../../core/constants.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_text_styles.dart';
import '../../../../core/resources/manager_weight.dart';
import '../../../home/presentation/model/home_model.dart';

class ShowMoreProducts extends StatefulWidget {
  const ShowMoreProducts({super.key});

  @override
  State<ShowMoreProducts> createState() => _ShowMoreProductsState();
}

class _ShowMoreProductsState extends State<ShowMoreProducts> {
  bool isIconChanged = false;
  //String displayedText = '1111';
  void toggleIconAndText() {
    setState(() {
      isIconChanged = !isIconChanged;
      // displayedText = isIconChanged ? 'النص الثاني' : 'النص الأول';
    });
  }

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
          InkWell(
              onTap: () {
                setState(() {
                  toggleIconAndText();
                });
              },
              child: isIconChanged
                  ? Image.asset(
                      height: 24, 'assets/images/more_products/menu2.png')
                  : Image.asset(
                      height: 24, 'assets/images/more_products/menu.png')),
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
              if (isIconChanged == true) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: controller.homeModel.data.length,
                    itemBuilder: (context, index) {
                      HomeModelData homeDataModel =
                          controller.homeModel.data[index];
                      return InkWell(
                        onTap: () {
                          controller.productDetails(context, homeDataModel.id);
                        },
                        child: Container(
                          margin: const EdgeInsetsDirectional.all(10),
                          padding: const EdgeInsetsDirectional.all(16),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(20))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    ManagerRaduis.r10,
                                  ),
                                  child: SizedBox(
                                    height: 80,
                                    width: 10,
                                    child: controller.image(
                                      courseAvatar: homeDataModel.thumbnailImage
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      homeDataModel.name.toString(),
                                      style: getBoldTextStyle(
                                          color: ManagerColors.blake),
                                    ),
                                  ),
                                  Text(
                                    homeDataModel.basePrice.toString(),
                                    style: getMediumTextStyle(
                                        color: ManagerColors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeDataModel.baseDiscountedPrice
                                            .toString(),
                                        style: getMediumTextStyle(
                                            color: ManagerColors.grey),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Visibility(
                                        visible:
                                            homeDataModel.baseDiscountedPrice !=
                                                0.0,
                                        child: Container(
                                          child: const Text('Discount',
                                              style: TextStyle(
                                                  color: ManagerColors
                                                      .primaryColor)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
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
                                      courseAvatar: homeDataModel.thumbnailImage
                                          .toString(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
              }
            }),
          )
        ],
      ),
    );
  }
}
