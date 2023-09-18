import 'package:shop_avatar/core/resources/manager_weight.dart';

import '../../../../config/localization/dependancy_injection.dart';
import '../../../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import '../../../../routes/routes.dart';
import '/features/home/data/data_source/home_api_controller.dart';
import '/features/home/presentation/model/home_model.dart';
import '/features/product_details/domain/model/product_details_model.dart';
import '/features/product_details/domain/use_case/product_details_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_height.dart';
import '../model/category_model.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = [];
  HomeModel homeModel = HomeModel(data: [], success: true, status: 200);
  ProductDetailsModel productDetailsModel =
      ProductDetailsModel(data: [], success: true, status: 200);
  HomeApiController homeApiController = HomeApiController();
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  List<HomeModelData> featuredProducts = [];
  List<HomeModelData> discountedProducts = [];
  ProductDetailsUseCaseImplementation productDetailsUseCase =
      instance<ProductDetailsUseCaseImplementation>();

  @override
  void onInit() {
    super.onInit();
    readCategories();
    readHome();
  }

  readCategories() async {
    categories = await homeApiController.categories(context: Get.context!);
    update();
  }

  readHome() async {
    homeModel = await homeApiController.home(context: Get.context!);
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

  readProductDetails(int id) async {
    BuildContext context = Get.context!;
    (await productDetailsUseCase.execute(ProductDetailsUseCaseInput(id: id)))
        .fold((l) {
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.massege,
        title: '',
      );
    }, (r) {
      productDetailsModel = r;
    });
    update();
  }

  readpassword(int id) async {
    BuildContext context = Get.context!;
    (await productDetailsUseCase.execute(ProductDetailsUseCaseInput(id: id)))
        .fold((l) {
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.massege,
        title: '',
      );
    }, (r) {
      productDetailsModel = r;
    });
    update();
  }

  Widget image({required String courseAvatar, String? defaultImage}) {
    if (isURLValid(courseAvatar)) {
      return Image.network(
        courseAvatar,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.product,
      fit: BoxFit.fill,
      width: ManagerWeight.w156,
      height: ManagerHeight.h148,
    );
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

  productDetails(BuildContext context, int productId) {
    readProductDetails(productId);
    Navigator.pushNamed(context, Routes.itemDetails);
  }
}

bool isURLValid(String url) {
  Uri? uri = Uri.tryParse(url);
  return uri != null && uri.isAbsolute;
}
