import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/routes.dart';
import '../../../../core/widegts/base_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _textEmailEditingController;
  late TextEditingController _textPasswordEditingController;
  @override
  void initState() {
    super.initState();
    _textEmailEditingController = TextEditingController();
    _textPasswordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: ManagerConestant.elevationAppbar,
        backgroundColor: ManagerColors.transparent,
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsets.symmetric(horizontal: ManagerHeight.h40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                ManagerStrings.signUp.toUpperCase(),
                style: const TextStyle(
                  letterSpacing: ManagerConestant.letterSpacingWithSignInText,
                  color: ManagerColors.textcolor,
                  fontSize: ManagerFontSize.s30,
                  fontWeight: ManagerFontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            TextField(
              controller: _textEmailEditingController,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  label: Text(
                    ManagerStrings.username,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.grey),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ManagerColors.primaryColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.textcolor))),
            ),
            const Spacer(),
            TextField(
              controller: _textPasswordEditingController,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  label: Text(
                    ManagerStrings.email,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.grey),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ManagerColors.primaryColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.textcolor))),
            ),
            const Spacer(),
            TextField(
              controller: _textPasswordEditingController,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  label: Text(
                    ManagerStrings.numberCity,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.grey),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ManagerColors.primaryColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.textcolor))),
            ),
            const Spacer(),
            TextField(
              controller: _textPasswordEditingController,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  label: Text(
                    ManagerStrings.password,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.grey),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ManagerColors.primaryColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.textcolor))),
            ),
            const Spacer(),
            TextField(
              controller: _textPasswordEditingController,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  label: Text(
                    ManagerStrings.confirmPassword,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.grey),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ManagerColors.primaryColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.textcolor))),
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  ManagerStrings.alreadyhaveAcoount,
                  style: TextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.textcolor),
                ),
                TextButton(
                  child: const Text(
                    ManagerStrings.login,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginView);
                  },
                )
              ],
            ),
            const Spacer(),
            base_button(
              title: ManagerStrings.signUp,
              onPeessed: () {
                //Navigator.pushNamed(context, Routes.HomePage);
              },
              isVisibalIcon: false,
              spacer: ManagerConestant.Spacer3,
              bgColor: ManagerColors.primaryColor,
              textStyle: const TextStyle(
                  color: ManagerColors.white, fontSize: ManagerFontSize.s18),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}