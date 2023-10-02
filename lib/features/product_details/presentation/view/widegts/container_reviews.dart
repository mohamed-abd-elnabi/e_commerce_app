import 'package:flutter/material.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_text_styles.dart';
import '../../../../../core/resources/manager_weight.dart';
import '../../../../home/presentation/controller/home_controller.dart';

Container ContainerReviews(HomeController controller) {
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
                              child: Image.asset(
                                controller.reviews[index].imgPath,
                                width: ManagerWeight.w38,
                                height: ManagerHeight.h38,
                              ),
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
                                      size: 20,
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
                          padding: const EdgeInsets.only(
                            top: 5,
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
                      width: ManagerWeight.w320,
                      height: ManagerHeight.h40,
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
        const Divider(height: 10, color: Colors.grey),
        Visibility(
          visible: controller.counter < controller.reviews.length,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                if (controller.counter < controller.reviews.length) {
                  controller.reviewHeight += controller.itemHeight + 30;
                  controller.counter++;
                }
              },
              child: const Column(
                children: [
                  Text(
                    'more',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(260, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            onPressed: () {},
            child: const Text(
              'Add Review',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
