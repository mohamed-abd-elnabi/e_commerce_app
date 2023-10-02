import 'package:shop_avatar/features/home/presentation/view/widegts/filters_widget.dart';
import 'package:shop_avatar/routes/routes.dart';
import '/core/resources/managar_font_size.dart';
import '/core/resources/manager_raduis.dart';
import '/features/home/presentation/view/widegts/CategoriesList.dart';
import '/features/home/presentation/view/widegts/home_appbar.dart';
import '/features/home/presentation/view/widegts/product_card_item.dart';
import '/features/home/presentation/view/widegts/section_title.dart';
import '/features/home/presentation/view/widegts/slider_drawer.dart';
import '../../../../core/resources/manager_weight.dart';
import '../controller/home_controller.dart';
import '../model/home_model.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_strings.dart';
import '/core/resources/manager_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_drawer/slide_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideDrawer(
      drawer: const SliderDrawer(),
      child: Scaffold(
        backgroundColor: ManagerColors.homeScaffoldBackGround,
        appBar: HomeAppBar(
          appBar: AppBar(),
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
            start: ManagerWeight.w20,
          ),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return RefreshIndicator(
                color: ManagerColors.primaryColor,
                backgroundColor: ManagerColors.white,
                onRefresh: () async {
                  controller.performRefresh();
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        SizedBox(height: ManagerHeight.h56),
                        Column(
                          children: [
                            CategoriesList(controller),
                            SizedBox(height: ManagerHeight.h20),
                            sectionTitle(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.showMoreProducts);
                              },
                            ),
                            SizedBox(
                              height: ManagerHeight.h20,
                            ),
                            Container(
                              height: ManagerHeight.h320,
                              width: ManagerWeight.w300,
                              alignment: Alignment.center,
                              margin: EdgeInsetsDirectional.only(
                                end: ManagerWeight.w12,
                              ),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.bestItemsCard(
                                  controller.homeModel.data.length,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  HomeModelData homeDataModel =
                                      controller.homeModel.data[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.productDetails(
                                          context, homeDataModel.id);
                                    },
                                    child: LayoutBuilder(
                                      builder: (
                                        BuildContext context,
                                        BoxConstraints constraints,
                                      ) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  ManagerRaduis.r10,
                                                ),
                                                child: controller.image(
                                                  courseAvatar: homeDataModel
                                                      .thumbnailImage
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: getMediumTextStyle(
                                                      color:
                                                          ManagerColors.blake,
                                                      fontSize:
                                                          ManagerFontSize.s14,
                                                    ),
                                                  ),
                                                  Text(
                                                    controller.productPrice(
                                                        homeDataModel.basePrice
                                                            .toString(),
                                                        homeDataModel.unit),
                                                    style: getMediumTextStyle(
                                                      color:
                                                          ManagerColors.blake,
                                                      fontSize:
                                                          ManagerFontSize.s12,
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: ManagerWeight.w10,
                                  mainAxisSpacing: ManagerHeight.h10,
                                ),
                              ),
                            ),

                            // Features Items In GridView
                            sectionTitle(
                              title: ManagerStrings.features,
                            ),
                            SizedBox(
                              height: ManagerHeight.h20,
                            ),
                            Container(
                              height: ManagerHeight.h210,
                              margin: EdgeInsets.only(left: ManagerWeight.w20),
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1.35,
                                ),
                                itemBuilder: (context, index) {
                                  HomeModelData item =
                                      controller.featuredProducts[index];
                                  return ProductCardItem(item: item);
                                },
                                itemCount: controller.featuredProducts.length,
                              ),
                            ),

                            // Discounted Items In GridView
                            sectionTitle(
                              title: ManagerStrings.discounted,
                            ),
                            SizedBox(
                              height: ManagerHeight.h20,
                            ),
                            Container(
                              height: ManagerHeight.h210,
                              margin: EdgeInsets.only(left: ManagerWeight.w20),
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1.35,
                                ),
                                itemBuilder: (context, index) {
                                  HomeModelData item =
                                      controller.discountedProducts[index];
                                  return ProductCardItem(item: item);
                                },
                                itemCount: controller.discountedProducts.length,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                              ManagerStrings.search,
                              style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s14,
                                color: ManagerColors.grey,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              openFilters(context);
                            },
                            icon: const Icon(
                              Icons.filter_list_rounded,
                              color: ManagerColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
