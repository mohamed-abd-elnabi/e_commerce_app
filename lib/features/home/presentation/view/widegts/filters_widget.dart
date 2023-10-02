import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_spacer.dart';
import '../../../../../core/resources/manager_text_styles.dart';
import '../../../../../core/widegts/base_button.dart';
import 'custom_button.dart';

// ignore: must_be_immutable
class FiltersWidget extends StatelessWidget {
  FiltersWidget({super.key});
  int cuttentpageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.sizeOf(context).height * 0.5,
      width: double.infinity,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ManagerHeight.h26,
              ),
              Text(ManagerStrings.byCategory, style: getBoldTextStyle()),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomButton(
                      onPressed: () {},
                      text: ManagerStrings.all,
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: ManagerWeight.w6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: ManagerStrings.freshFruits,
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: ManagerWeight.w6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: ManagerStrings.freshFruits,
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: ManagerWeight.w6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: ManagerStrings.freshHerbs,
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white),
                    ),
                    SizedBox(
                      width: ManagerWeight.w6,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: ManagerStrings.freshFruits,
                      backgroundColor: ManagerColors.primaryColor,
                      textStyle: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ManagerHeight.h26,
              ),
              Divider(
                color: ManagerColors.prossColor,
              ),
              SizedBox(
                height: ManagerHeight.h26,
              ),
              Text(ManagerStrings.byPrice, style: getBoldTextStyle()),
              const RangeSliderExample(),
              SizedBox(
                height: ManagerHeight.h36,
              ),
              base_button(
                title: ManagerStrings.save,
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

void openFilters(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return FiltersWidget();
    },
  );
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
