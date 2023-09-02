import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/core/resources/manager_icon_size.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller..dart';
import 'package:shop_avatar/features/home/presentation/model/home_model.dart';
import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_text_styles.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.item,
  });

  final HomeModelData item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ManagerRaduis.r10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                item.thumbnailImage,
                fit: BoxFit.cover,
                width: ManagerWeight.w130,
                height: ManagerHeight.h120,
              ),
              SizedBox(height: ManagerHeight.h10),
              Text(
                item.name,
                style: getMediumTextStyle(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                controller.productPrice(item.basePrice.toString(), item.unit),
                style: getMediumTextStyle(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: ManagerIconSize.s16,
                  ),
                  Text(
                    controller.productRating(
                      item.rating.toString(),
                    ),
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
