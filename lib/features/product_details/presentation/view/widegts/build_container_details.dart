import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../core/resources/manager_font_weight.dart';
import '../../../../../core/resources/manager_icon_size.dart';
import '../../controller/product_details_controller.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_text_styles.dart';
import 'expandable_text.dart';

Container buildContainerDetails(ProductDetailsController controller) {
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
          margin: EdgeInsets.symmetric(vertical: ManagerHeight.h20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'spray',
                    style: getTextStyle(
                      fontSize: ManagerFontSize.s20,
                      fontWeight: ManagerFontWeight.w600,
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
                          size: ManagerIconSize.s16,
                        ),
                        Text(
                          '(5.0) ',
                          style: getTextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '26 orders',
                          style: getRegularTextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                '\$5.35',
                style: getTextStyle(
                    fontSize: ManagerFontSize.s18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: ManagerHeight.h10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity',
                style: getTextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: ManagerFontSize.s14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: ManagerHeight.h30,
                width: ManagerWeight.w100,
                padding: EdgeInsets.only(
                  top: ManagerHeight.h6,
                  bottom: ManagerHeight.h6,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(ManagerRaduis.r20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (controller.numQuantity > 1) {
                          controller.numQuantity--;
                        }
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: ManagerFontSize.s18,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      controller.numQuantity.toString(),
                      style: getBoldTextStyle(),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        controller.numQuantity++;
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: ManagerFontSize.s18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: ManagerHeight.h20),
        Text(
          'Description ',
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s14,
          ),
        ),
        SizedBox(height: ManagerHeight.h10),
        SizedBox(
          child: ExpandableText(),
        ),
        SizedBox(height: ManagerHeight.h20),
        Text(
          ManagerStrings.notes,
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s14,
          ),
        ),
        TextField(
          cursorColor: Colors.deepOrangeAccent,
          decoration: InputDecoration(
            labelText: ManagerStrings.writeHere,
            labelStyle: getRegularTextStyle(
              fontSize: ManagerFontSize.s14,
              color: Colors.grey,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent),
            ),
          ),
        ),
        SizedBox(height: ManagerHeight.h34),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ManagerStrings.price,
              style: getBoldTextStyle(
                fontSize: ManagerFontSize.s14,
              ),
            ),
            Text(
              '\$5.35',
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s18,
                  color: Colors.deepOrangeAccent),
            )
          ],
        ),
        SizedBox(height: ManagerHeight.h30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(ManagerWeight.w156, ManagerHeight.h56),
                  backgroundColor: ManagerColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
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
                  minimumSize: Size(ManagerWeight.w156, ManagerHeight.h56),
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
        SizedBox(height: ManagerHeight.h30),
      ],
    ),
  );
}
