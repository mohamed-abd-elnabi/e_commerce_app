import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:shop_avatar/core/widegts/helpers.dart';
import 'package:shop_avatar/features/home/data/mapper/category_mapper.dart';
import 'package:shop_avatar/features/home/data/mapper/home_mapper.dart';
import 'package:shop_avatar/features/home/data/response/category_response.dart';
import 'package:shop_avatar/features/home/data/response/home_response.dart';
import 'package:shop_avatar/features/home/presentation/model/category_model.dart';
import 'package:shop_avatar/features/home/presentation/model/home_model.dart';
import '../../../../core/constants.dart';

class HomeApiController with Helpers {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  Future get({
    required String endPoint,
    required Map<String, String> headers,
  }) async {
    return await http.get(
      Uri.parse(endPoint),
      headers: headers,
    );
  }

  Future<HomeModel> home({required BuildContext context}) async {
    http.Response response = await get(endPoint: ApiRequest.home, headers: {});
    var statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      var json = jsonDecode(response.body);
      return HomeResponse.fromJson(json).toDomain();
    } else if (statusCode >= 400 && statusCode > 400) {
      var json = jsonDecode(response.body);
      return HomeModel(
          data: [], success: json['success'], status: json['status']);
    }

    showSnackBar(
      context: context,
      message: ManagerStrings.somthingWentErorr,
      error: true,
    );
    return HomeModel(data: [], success: false, status: 404);
  }

  Future<List<CategoryModel>> categories(
      {required BuildContext context}) async {
    http.Response response =
        await get(endPoint: ApiRequest.categories, headers: {});

    var json = jsonDecode(response.body);

    List<dynamic> data = json['data'] ?? [];

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data.map((categorie) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(categorie);
        return categoryResponse.toDomain();
      }).toList();
    }

    showSnackBar(
      context: context,
      message: json[ApiConstants.errorMassage] ?? 'Error',
      error: true,
    );
    return [];
  }
}
