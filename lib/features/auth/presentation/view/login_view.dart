import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';
import '../../../../core/widegts/base_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: ManagerConestant.elevationAppbar,
        backgroundColor: ManagerColors.transparent,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          alignment: AlignmentDirectional.center,
          margin: EdgeInsets.symmetric(horizontal: ManagerHeight.h24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ManagerAssets.logoapplogin,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: ManagerHeight.h18,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  ManagerStrings.signIn.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: ManagerConestant.letterSpacingWithSignInText,
                    color: ManagerColors.textcolor,
                    fontSize: ManagerFontSize.s30,
                    fontWeight: ManagerFontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              TextField(
                controller: _textEmailEditingController,
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
                        borderSide:
                            BorderSide(color: ManagerColors.textcolor))),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
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
                        borderSide:
                            BorderSide(color: ManagerColors.textcolor))),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Row(
                children: [
                  Container(
                    width: ManagerWeight.w10,
                    height: ManagerHeight.h10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ManagerColors.primaryColor)),
                  ),
                  Text(
                    ManagerStrings.rememberMe,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.textcolor),
                  ),
                  SizedBox(
                    width: ManagerHeight.h10,
                  ),
                  Text(
                    ManagerStrings.forgetPassword,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h34,
              ),
              Row(
                children: [
                  Text(
                    ManagerStrings.haveAcoount,
                    style: TextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.textcolor),
                  ),
                  TextButton(
                    child: Text(
                      ManagerStrings.signUp,
                      style: TextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.primaryColor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerView);
                    },
                  )
                ],
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              base_button(
                title: ManagerStrings.login,
                onPeessed: () {
                  Navigator.pushNamed(context, Routes.loginView);
                },
                isVisibalIcon: false,
                spacer: ManagerConestant.Spacer3,
                bgColor: ManagerColors.primaryColor,
                textStyle: TextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Text(
                ManagerStrings.or,
                style: TextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.textcolor),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ManagerAssets.facebookIconSignIn),
                  Image.asset(ManagerAssets.googelIconSignIn),
                  Image.asset(ManagerAssets.twitterIconSignIn),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
