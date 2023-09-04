import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../core/resources/manager_icon_size.dart';
import '../../../../../core/resources/manager_padding.dart';
import '../../../controller/item_details.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_text_styles.dart';

class buildContainerReviews extends StatefulWidget {
  const buildContainerReviews({super.key});

  @override
  State<buildContainerReviews> createState() => _buildContainerReviewsState();
}

class _buildContainerReviewsState extends State<buildContainerReviews> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.only(
          bottom: ManagerHeight.h6,
          left: ManagerWeight.w24,
          right: ManagerWeight.w24,
          top: ManagerHeight.h24,
        ),
        child: Column(
          children: [
            SizedBox(
              height: controller.reviewHeight,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.reviews.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: ManagerWeight.w320,
                    height: controller.itemHeight,
                    margin: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h18,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: AssetImage(
                                      controller.reviews[index].imgPath),
                                ),
                                SizedBox(width: ManagerWeight.w12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.reviews[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: ManagerIconSize.s20,
                                        ),
                                        Text(
                                          '(${controller.reviews[index].numStars})',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: ManagerHeight.h6,
                              ),
                              child: Text(
                                '${controller.reviews[index].time}min',
                                style: getMediumTextStyle(
                                  color: ManagerColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ManagerHeight.h6,
                        ),
                        SizedBox(
                          child: Text(
                            controller.reviews[index].content!,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w300,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(height: ManagerHeight.h10, color: Colors.grey),
            Visibility(
              visible: controller.counter < controller.reviews.length,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    elevation: ManagerConestant.elevationAppbar,
                  ),
                  onPressed: () {
                    setState(() {
                      if (controller.counter < controller.reviews.length) {
                        controller.reviewHeight += controller.itemHeight + 30;
                        controller.counter++;
                      }
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        ManagerStrings.more,
                        style: getRegularTextStyle(
                          color: Colors.grey,
                          fontSize: ManagerFontSize.s16,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(ManagerPadding.p10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(ManagerWeight.w260, ManagerHeight.h50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ManagerRaduis.r12),
                  ),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: () {},
                child: Text(
                  ManagerStrings.addReview,
                  style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.white),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
