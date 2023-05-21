import 'package:flutter/material.dart';
import 'package:news_mobile/models/category_model.dart';
import 'package:news_mobile/repositories/category/category_repository.dart';
import 'package:news_mobile/utils/enums/screen_status.dart';

class CategoryViewModel with ChangeNotifier {
  ScreenStatus screenStatus = ScreenStatus.SUCCESS;
  CategoryRepository categoryRepository = CategoryRepository();

  List<CategoryModel> categories = [];
  CategoryModel category = CategoryModel();

  Future getCategories(BuildContext context) async {
    try {
      screenStatus = ScreenStatus.LOADING;
      notifyListeners();

      categories = await categoryRepository.getCategories(context, {});

      screenStatus = ScreenStatus.SUCCESS;
      notifyListeners();
    } catch (e) {
      screenStatus = ScreenStatus.ERROR;
      notifyListeners();
    }
  }

  Future getCategoryDetail(BuildContext context, int categoryId) async {
    try {
      screenStatus = ScreenStatus.LOADING;
      notifyListeners();

      Map payload = CategoryModel(id: categoryId).toDetailPayload();
      category =
          (await categoryRepository.getCategoryDetail(context, payload))!;

      screenStatus = ScreenStatus.SUCCESS;
      notifyListeners();
    } catch (e) {
      screenStatus = ScreenStatus.ERROR;
      notifyListeners();
    }
  }
}
