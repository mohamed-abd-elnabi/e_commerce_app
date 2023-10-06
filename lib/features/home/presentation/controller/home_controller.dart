import 'package:shop_avatar/core/resources/manager_weight.dart';
import '../../../../config/localization/dependancy_injection.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import '../../../../routes/routes.dart';
import '../../../product_details/presentation/model/Review.dart';
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
  ////
  late PageController pageController;
  int currentPageIndex = 0;
  bool isFavorite = false;

  bool isDetails = true;
  bool isReviews = false;
  double itemHeight = 95;
  late double reviewHeight;
  late int counter;

  int numQuantity = 1;

  List<Review> reviews = [
    Review(
        id: 0,
        name: 'Mohammed Emad',
        imgPath: ManagerAssets.facebookIconSignIn,
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Emad',
        imgPath: ManagerAssets.facebookIconSignIn,
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Emad',
        imgPath: ManagerAssets.facebookIconSignIn,
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Emad',
        imgPath: ManagerAssets.facebookIconSignIn,
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Emad',
        imgPath: ManagerAssets.facebookIconSignIn,
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Emad',
        imgPath: ManagerAssets.facebookIconSignIn,
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  ////
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
  NetworkInfo networkInfo = instance<NetworkInfo>();
  @override
  void onInit() {
    super.onInit();
    readCategories();
    readHome();
    /////////////////////
    pageController = PageController(initialPage: 0);
    counter = 3;
    reviewHeight = itemHeight * counter + 120;
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
        message: l.message,
        title: '',
      );
    }, (r) {
      productDetailsModel = r;
    });
    update();
  }

  readPassword(int id) async {
    BuildContext context = Get.context!;
    (await productDetailsUseCase.execute(ProductDetailsUseCaseInput(id: id)))
        .fold((l) {
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
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
        fit: BoxFit.scaleDown,
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

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  performRefresh() async {
    if (await networkInfo.isConnected) {
      await readHome();
    } else {
      BuildContext context = Get.context!;
      dialogRender(
        context: context,
        message: 'NO_INTERNT_CONNECTION',
        title: '',
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Navigator.of(context).pop();
        },
      );
    }
  }
}
