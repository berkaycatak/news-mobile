import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_mobile/models/category_model.dart';
import 'package:news_mobile/services/request/request_service.dart';

class CategoryRepository {
  RequestServices requestServices = RequestServices();

  Future<List<CategoryModel>> getCategories(
    BuildContext context,
    Map payload,
  ) async {
    try {
      Response? response = await requestServices.sendRequest(
        path: "categories/all",
        payload: payload,
        isToken: false,
      );

      if (response == null) {
        return [];
      }

      dynamic jsonResponse = requestServices.returnResponse(response, context);
      List<dynamic> _jsonResponse = jsonResponse["categories"];
      List<CategoryModel> categories = [];

      _jsonResponse.forEach((element) {
        categories.add(CategoryModel.fromJson(element));
      });

      return categories;
    } catch (e) {
      return [];
    }
  }

  Future<CategoryModel?> getCategoryDetail(
    BuildContext context,
    Map payload,
  ) async {
    try {
      Response? response = await requestServices.sendRequest(
        path: "categories/single",
        payload: payload,
        isToken: false,
      );

      if (response == null) {
        return null;
      }

      dynamic responseJson = requestServices.returnResponse(response, context);

      dynamic _categoryJson = responseJson["category"];
      return CategoryModel.fromJson(_categoryJson);
    } catch (e) {
      return null;
    }
  }
}
