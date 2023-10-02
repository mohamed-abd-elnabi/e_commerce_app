import 'package:flutter/material.dart';
import '../../../../../core/resources/managar_font_size.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_raduis.dart';
import '../../../../../core/resources/manager_text_styles.dart';
import '../../../../../core/resources/manager_weight.dart';
import '../../../../home/presentation/controller/home_controller.dart';
import '../../../../home/presentation/model/home_model.dart';

Container SizedBoxSecondForm(
    BuildContext context, HomeController controllerHome) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.8,
    width: ManagerWeight.w320,
    alignment: Alignment.center,
    margin: EdgeInsetsDirectional.only(
      end: ManagerWeight.w12,
    ),
    child: GridView.builder(
      itemBuilder: (BuildContext context, int index) {
        HomeModelData homeDataModel = controllerHome.homeModel.data[index];
        return InkWell(
          onTap: () {
            controllerHome.productDetails(context, homeDataModel.id);
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
                      child: controllerHome.image(
                        courseAvatar: homeDataModel.thumbnailImage.toString(),
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
                          controllerHome.productPrice(
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
      itemCount: controllerHome.homeModel.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: ManagerWeight.w10,
        mainAxisSpacing: ManagerHeight.h10,
      ),
    ),
  );
}
