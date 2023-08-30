import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_avatar/features/home/data/data_source/home_api_controller.dart';

import '../model/category_model.dart';

class HomeController extends GetxController {
  List<CategoryModel> categoryList = [];
  HomeApiController apiController = HomeApiController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readCategories();
  }

  readCategories() async {
    categoryList = await apiController.categories(context: Get.context!);
    update();
  }
}
