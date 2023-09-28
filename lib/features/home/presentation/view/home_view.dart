import 'package:shop_avatar/routes/routes.dart';

import '../../../../core/resources/manager_spacer.dart';
import '../../../../core/widegts/base_button.dart';
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
                              _openFilters(context);
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

class FiltersWidget extends StatelessWidget {
  int cuttentpageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: double.infinity,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 26,
              ),
              Text('By Category', style: getBoldTextStyle()),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomButton(
                      onPressed: () {},
                      text: 'All',
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: 16, color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Fresh Fruits',
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: 16, color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Fresh Vegetables',
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: 16, color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Fresh Herbs',
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: 16, color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'Fresh Fruits',
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: 16, color: ManagerColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Divider(
                color: ManagerColors.prossColor,
              ),
              SizedBox(
                height: 26,
              ),
              Text('By Price', style: getBoldTextStyle()),
              RangeSliderExample(),
              SizedBox(
                height: 36,
              ),
              base_button(
                title: 'Save',
                onPreessed: () {},
                isVisibalIcon: false,
                spacer: ManagerSpacer.s3,
                bgColor: ManagerColors.primaryColor,
                textStyle: getRegularTextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
            ]),
      ),
    );
  }
}

void _openFilters(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return FiltersWidget();
    },
  );
}

class CustomButton extends StatelessWidget {
  final ValueChanged<bool>? onFocusChange;
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final TextStyle? textStyle;

  CustomButton({
    required this.onPressed,
    this.onFocusChange,
    required this.text,
    this.backgroundColor = Colors.blue, // اللون الافتراضي هو الأزرق
    this.fontSize = 15,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onFocusChange: onFocusChange,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(100, 38),
      ),
      child: Text(
        text,
        style: textStyle ?? TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    );
  }
}

class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});

  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: ManagerColors.primaryColor,
      inactiveColor: ManagerColors.prossColor,
      values: _currentRangeValues,
      max: 100,
      divisions: 5,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
