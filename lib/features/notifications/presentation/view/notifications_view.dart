import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'.toUpperCase(),
            style: getRegularTextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: const Color(0xffF8F8FC),
      ),
      body: Center(
          child: Container(
        child: Image.asset('assets/images/notifications/disable-alarm.png'),
      )),
    );
  }
}
