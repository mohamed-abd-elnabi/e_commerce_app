import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/resources/manager_raduis.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../config/locale/locale_settings.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_icon_size.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_text_styles.dart';
import '../controller/locale_notifier_controller.dart';

class LocaleView extends StatelessWidget {
  const LocaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ManagerStrings.language,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s18,
          ),
        ),
      ),
      body: GetBuilder<LocaleNotifierController>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: ManagerHeight.h20,
              ),
              Container(
                width: double.infinity,
                height: ManagerHeight.h50,
                margin: EdgeInsets.symmetric(horizontal: ManagerWeight.w10),
                decoration: BoxDecoration(
                  border: Border.all(color: ManagerColors.greyLight),
                  borderRadius: BorderRadius.circular(ManagerRaduis.r10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownStyleData: DropdownStyleData(
                      elevation: 0,
                      decoration: BoxDecoration(
                        color: ManagerColors.primaryColor,
                        borderRadius: BorderRadius.circular(ManagerRaduis.r10),
                      ),
                    ),
                    customButton: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ManagerWeight.w10,
                        ),
                        const Icon(
                          Icons.language,
                          color: ManagerColors.blake,
                        ),
                        SizedBox(width: ManagerWeight.w10),
                        Text(
                          ManagerStrings.language,
                          style: getMediumTextStyle(
                            fontSize: ManagerIconSize.s14,
                            color: ManagerColors.blake,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          LocaleSettings
                                  .languages[controller.currentLanguage] ??
                              ManagerStrings.ar,
                          style: getMediumTextStyle(
                            fontSize: ManagerIconSize.s14,
                            color: ManagerColors.blake,
                          ),
                        ),
                        SizedBox(width: ManagerWeight.w10),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: ManagerIconSize.s16,
                          color: ManagerColors.white,
                        ),
                        SizedBox(
                          width: ManagerWeight.w10,
                        ),
                      ],
                    ),
                    items: controller.languagesList.values.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: getMediumTextStyle(
                            fontSize: ManagerIconSize.s14,
                            color: ManagerColors.white,
                          ),
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    value: LocaleSettings.languages[controller.currentLanguage],
                    onChanged: (value) {
                      for (var entry in controller.languagesList.entries) {
                        if (entry.value == value) {
                          controller.changeLanguage(
                            context: context,
                            languageCode: entry.key,
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
