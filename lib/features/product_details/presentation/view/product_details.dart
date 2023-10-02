import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/product_details/presentation/view/widegts/container_reviews.dart';
import 'package:shop_avatar/features/product_details/presentation/view/widegts/expandable_text.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_icon_size.dart';
import '../../../../core/widegts/page_view_indicator.dart';
import '../../../../routes/routes.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_font_weight.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_strings.dart';
import '/core/resources/manager_text_styles.dart';
import '/features/home/presentation/controller/home_controller.dart';
import '/features/product_details/domain/model/product_details_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
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
        elevation: 0,
        title: Text(
          ManagerStrings.productDetails,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return ListView(
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
                        ...List.generate(
                          controller
                              .productDetailsModel.data.first.photos.length,
                          (index) => Image.network(
                            controller.productDetailsModel.data.first
                                .photos[index].path,
                            fit: BoxFit.fill,
                          ),
                        )
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
                                controller.isFavorite = !controller.isFavorite;
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
                              ...List.generate(
                                controller.productDetailsModel.data.first.photos
                                    .length,
                                (index) => Row(
                                  children: [
                                    PageViewIndicator(
                                      selected:
                                          controller.currentPageIndex == 0,
                                      color: Colors.white,
                                      elseColor: Colors.white.withOpacity(0.6),
                                    ),
                                    SizedBox(
                                      width: ManagerWeight.w8,
                                    ),
                                  ],
                                ),
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
                    height: 57,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isDetails
                            ? Colors.transparent
                            : Colors.grey.shade300,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          controller.isDetails = true;
                          controller.isReviews = false;
                        });
                      },
                      child: Text(
                        'DETAILS',
                        style: getBoldTextStyle(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 57,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isReviews
                              ? Colors.transparent
                              : Colors.grey.shade300,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey.shade300))),
                      onPressed: () {
                        setState(() {
                          controller.isDetails = false;
                          controller.isReviews = true;
                        });
                      },
                      child: Text(
                        'REVIEWS',
                        style: getBoldTextStyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: controller.isDetails,
              replacement: ContainerReviews(controller),
              child: buildContainerDetails(controller),
            )
          ],
        );
      }),
    );
  }

  Container buildContainerDetails(HomeController controller) {
    ProductDetailsDataModel item = controller.productDetailsModel.data.first;
    return Container(
      margin: EdgeInsets.only(
        left: ManagerWeight.w30,
        right: ManagerWeight.w30,
        bottom: ManagerHeight.h10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        item.name,
                        style: getTextStyle(
                          fontSize: ManagerIconSize.s20,
                          fontWeight: ManagerFontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ManagerHeight.h6,
                      ),
                      padding: EdgeInsets.zero,
                      height: ManagerHeight.h20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade800,
                            size: 16,
                          ),
                          Text(
                            '(${item.rating.toString()}) ',
                            style: getBoldTextStyle(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  item.mainPrice,
                  style: getBoldTextStyle(
                      fontSize: ManagerIconSize.s18, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'quantity',
                  style: getBoldTextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: ManagerIconSize.s14,
                  ),
                ),
                Container(
                  height: ManagerHeight.h32,
                  width: ManagerWeight.w110,
                  padding: EdgeInsets.only(
                    top: ManagerHeight.h6,
                    bottom: ManagerHeight.h6,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(
                      ManagerRaduis.r12,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (controller.numQuantity > 1) {
                              controller.numQuantity--;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        controller.numQuantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            controller.numQuantity++;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'description',
            style: getBoldTextStyle(
              fontSize: ManagerIconSize.s14,
            ),
          ),
          SizedBox(height: ManagerHeight.h12),
          ExpandableText(),
          const SizedBox(height: 20),
          const Text(
            'Notes ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const TextField(
            cursorColor: Colors.deepOrangeAccent,
            decoration: InputDecoration(
              labelText: 'Write here',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          const SizedBox(height: 35),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PRICE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$5.35',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(155, 50),
                    backgroundColor: ManagerColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.cartView);
                  },
                  child: Text(
                    'addToCart',
                    style: getMediumTextStyle(
                      color: ManagerColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(155, 50),
                    backgroundColor: ManagerColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'checkout',
                    style: getMediumTextStyle(
                      color: ManagerColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
