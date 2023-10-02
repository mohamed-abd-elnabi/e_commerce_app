import 'package:get/get.dart';

class ShowMoreProductsController extends GetxController {
  bool isIconChanged = false;
  void toggleIconAndText() {
    isIconChanged = !isIconChanged;
    update();
  }
}
