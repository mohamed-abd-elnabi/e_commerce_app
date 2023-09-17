import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_avatar/features/home/presentation/model/home_model.dart';
import '../../../../config/localization/dependancy_injection.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import '../../../../routes/routes.dart';
import '../../../product_details/domain/model/product_details_model.dart';
import '../../../product_details/domain/use_case/product_details_use_case.dart';
import '../../../product_details/presentation/view/Review.dart';
import '../../data/data_source/home_api_controller.dart';
import '../model/category_model.dart';

class HomeController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  List<CategoryModel> categoryList = [];
  HomeModel homeModel = HomeModel(data: [], success: true, status: 200);
  HomeApiController apiController = HomeApiController();
  List<HomeModelData> featuredProducts = [];
  List<HomeModelData> discountedProducts = [];
  ProductDetailsUseCaseImplementation productDetailsUseCase =
      instance<ProductDetailsUseCaseImplementation>();
  ProductDetailsModel productDetailsModel =
      ProductDetailsModel(status: 200, success: true, data: []);
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
        name: 'Mohanned Emad',
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
        name: 'Mohanned Emad',
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
        name: 'Mohanned Emad',
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
        name: 'Mohanned Emad',
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
        name: 'Mohanned Emad',
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
        name: 'Mohanned Emad',
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
  void onInit() {
    super.onInit();
    readCategories();
    readHome();
    pageController = PageController(initialPage: 0);
    counter = 3;
    reviewHeight = itemHeight * counter + 120;
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

  readProductDetails(int id) async {
    BuildContext context = Get.context!;
    (await productDetailsUseCase.execute(ProductDetailsUseCaseInput(id: id)))
        .fold(
            (l) => {
                  dialogRender(
                    context: context,
                    stateRenderType: StateRenderType.popUpErrorState,
                    message: l.massege,
                    title: '',
                  ),
                },
            (r) => {
                  productDetailsModel = r,
                });
    update();
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

  Widget image({required String courseAvatar, String? defaultImage}) {
    return Image.network(
      courseAvatar,
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }
}
