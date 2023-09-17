// import 'package:flutter/material.dart';
// import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
// import 'package:get/get.dart';
// import 'package:shop_avatar/config/localization/dependancy_injection.dart';
// import 'package:shop_avatar/features/product_details/domain/model/product_details_model.dart';
// import 'package:shop_avatar/features/product_details/domain/use_case/product_details_use_case.dart';
//
// import '../../../../core/resources/manager_assets.dart';
// import '../view/Review.dart';
//
// class ProductDetailsController extends GetxController {
//   late PageController pageController;
//   ProductDetailsUesCaseImplementation productDetailsUesCase =
//       instance<ProductDetailsUesCaseImplementation>();
//   ProductDetailsModel productDetailsModel =
//       ProductDetailsModel(status: 200, success: true, data: []);
//   int currentPageIndex = 0;
//   bool isFavorite = false;
//   bool isDetails = true;
//   bool isReviews = false;
//   double itemHeight = 95;
//   late double reviewHeight;
//   late int counter;
//
//   int numQuantity = 1;
//
//   List<Review> reviews = [
//     Review(
//         id: 0,
//         name: 'Mohanned Emad',
//         imgPath: ManagerAssets.facebookIconSignIn,
//         numStars: 5.0,
//         time: '2',
//         content: 'Exercitationem neque aut architecto eum. '
//             'Ea blanditiis aliquid odit ipsa. Alias qui minus '
//             'quia similique voluptas sit doloremque. '
//             'Harum eaque officia reiciendis sit beatae voluptatem.'
//             ' Inventore sequi expedita maiores aliquid et pariatur.'),
//     Review(
//         id: 0,
//         name: 'Mohanned Emad',
//         imgPath: ManagerAssets.facebookIconSignIn,
//         numStars: 5.0,
//         time: '2',
//         content: 'Exercitationem neque aut architecto eum. '
//             'Ea blanditiis aliquid odit ipsa. Alias qui minus '
//             'quia similique voluptas sit doloremque. '
//             'Harum eaque officia reiciendis sit beatae voluptatem.'
//             ' Inventore sequi expedita maiores aliquid et pariatur.'),
//     Review(
//         id: 0,
//         name: 'Mohanned Emad',
//         imgPath: ManagerAssets.facebookIconSignIn,
//         numStars: 5.0,
//         time: '2',
//         content: 'Exercitationem neque aut architecto eum. '
//             'Ea blanditiis aliquid odit ipsa. Alias qui minus '
//             'quia similique voluptas sit doloremque. '
//             'Harum eaque officia reiciendis sit beatae voluptatem.'
//             ' Inventore sequi expedita maiores aliquid et pariatur.'),
//     Review(
//         id: 0,
//         name: 'Mohanned Emad',
//         imgPath: ManagerAssets.facebookIconSignIn,
//         numStars: 5.0,
//         time: '2',
//         content: 'Exercitationem neque aut architecto eum. '
//             'Ea blanditiis aliquid odit ipsa. Alias qui minus '
//             'quia similique voluptas sit doloremque. '
//             'Harum eaque officia reiciendis sit beatae voluptatem.'
//             ' Inventore sequi expedita maiores aliquid et pariatur.'),
//     Review(
//         id: 0,
//         name: 'Mohanned Emad',
//         imgPath: ManagerAssets.facebookIconSignIn,
//         numStars: 5.0,
//         time: '2',
//         content: 'Exercitationem neque aut architecto eum. '
//             'Ea blanditiis aliquid odit ipsa. Alias qui minus '
//             'quia similique voluptas sit doloremque. '
//             'Harum eaque officia reiciendis sit beatae voluptatem.'
//             ' Inventore sequi expedita maiores aliquid et pariatur.'),
//     Review(
//         id: 0,
//         name: 'Mohanned Emad',
//         imgPath: ManagerAssets.facebookIconSignIn,
//         numStars: 5.0,
//         time: '2',
//         content: 'Exercitationem neque aut architecto eum. '
//             'Ea blanditiis aliquid odit ipsa. Alias qui minus '
//             'quia similique voluptas sit doloremque. '
//             'Harum eaque officia reiciendis sit beatae voluptatem.'
//             ' Inventore sequi expedita maiores aliquid et pariatur.'),
//   ];
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     pageController = PageController(initialPage: 0);
//     counter = 3;
//     reviewHeight = itemHeight * counter + 120;
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   // productDetails(BuildContext context) {
//   //   Navigator.pushNamed(context, Routes.itemDetails);
//   // }
// }
