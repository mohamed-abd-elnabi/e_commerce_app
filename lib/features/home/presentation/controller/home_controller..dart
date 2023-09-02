import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/home/data/data_source/home_api_controller.dart';
import 'package:shop_avatar/features/home/presentation/model/home_model.dart';
import '../../../../core/resources/manager_height.dart';
import '../model/category_model.dart';

class HomeController extends GetxController {
  List<CategoryModel> categoryList = [];
  HomeModel homeModel = HomeModel(data: [], success: true, status: 200);
  HomeApiController apiController = HomeApiController();
  List<HomeModelData> featuredProducts = [];
  List<HomeModelData> discountedProducts = [];
  @override
  void onInit() {
    super.onInit();
    readCategories();
    readHome();
  }

  readCategories() async {
    categoryList = await apiController.categories(context: Get.context!);
    update();
  }

  readHome() async {
    homeModel = await apiController.home(context: Get.context!);
    for (HomeModelData item in homeModel.data) {
      if (item.featured == 1) {
        featuredProducts.add(item);
      }

      if (item.discount > 0) {
        discountedProducts.add(item);
      }
    }
    update();
  }

  String productPrice(String price, String unit) {
    return ' \$ $price \\$unit'.toUpperCase();
  }

  String productRating(String rate) {
    return '($rate)';
  }

  int bestItemsCard(int length) {
    return length > 4 ? 4 : length;
  }

  productDetails(BuildContext context) {
    Navigator.pushNamed(context, ' Routes.itemDetails');
  }

  Widget image({required String courseAvatar, String? defaultImage}) {
    return Image.network(
      courseAvatar,
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }
}
