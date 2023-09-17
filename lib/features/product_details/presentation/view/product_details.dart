import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller.dart';
import 'package:shop_avatar/features/product_details/presentation/view/widegts/build_container_details.dart';
import 'package:shop_avatar/features/product_details/presentation/view/widegts/build_container_reviews.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_icon_size.dart';
import '../../../../core/widegts/page_view_indicator.dart';
import '/core/resources/manager_assets.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_text_styles.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: ManagerIconSize.s34,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: ManagerConestant.elevationAppbar,
            title: Text(
              ManagerStrings.productDetails,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s18,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              SizedBox(
                width: ManagerWeight.w320,
                height: ManagerHeight.h310,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            controller.currentPageIndex = index;
                          });
                        },
                        children: [
                          Image.network(
                            ManagerAssets.product,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            ManagerAssets.product,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            ManagerAssets.product,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            ManagerAssets.product,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: ManagerWeight.w16,
                              top: ManagerHeight.h6,
                            ),
                            alignment: AlignmentDirectional.centerEnd,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  controller.isFavorite =
                                      !controller.isFavorite;
                                });
                              },
                              icon: controller.isFavorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.white.withOpacity(0.5),
                                      size: ManagerIconSize.s36,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: ManagerIconSize.s36,
                                    ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: ManagerHeight.h12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PageViewIndicator(
                                  selected: controller.currentPageIndex == 0,
                                  color: Colors.white,
                                  elseColor: Colors.white.withOpacity(0.6),
                                ),
                                SizedBox(
                                  width: ManagerWeight.w8,
                                ),
                                PageViewIndicator(
                                  selected: controller.currentPageIndex == 1,
                                  color: Colors.white,
                                  elseColor: Colors.white.withOpacity(0.6),
                                ),
                                SizedBox(
                                  width: ManagerWeight.w8,
                                ),
                                PageViewIndicator(
                                  selected: controller.currentPageIndex == 2,
                                  color: Colors.white,
                                  elseColor: Colors.white.withOpacity(0.6),
                                ),
                                SizedBox(
                                  width: ManagerWeight.w8,
                                ),
                                PageViewIndicator(
                                  selected: controller.currentPageIndex == 3,
                                  color: Colors.white,
                                  elseColor: Colors.white.withOpacity(0.6),
                                ),
                                SizedBox(
                                  width: ManagerWeight.w8,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: ManagerHeight.h56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isDetails
                              ? Colors.transparent
                              : Colors.grey.shade300,
                          elevation: ManagerConestant.elevationAppbar,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.isDetails = true;
                          controller.isReviews = false;
                          controller.update();
                        },
                        child: Text(
                          ManagerStrings.details,
                          style: getBoldTextStyle(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: ManagerHeight.h56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isReviews
                                ? Colors.transparent
                                : Colors.grey.shade300,
                            elevation: ManagerConestant.elevationAppbar,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey.shade300))),
                        onPressed: () {
                          controller.isDetails = false;
                          controller.isReviews = true;
                          controller.update();
                        },
                        child: Text(
                          ManagerStrings.reviews,
                          style: getBoldTextStyle(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: controller.isDetails,
                replacement: buildContainerReviews(),
                child: buildContainerDetails(controller),
              )
            ],
          ),
        );
      },
    );
  }
}
