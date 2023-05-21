import 'package:news_mobile/models/category_model.dart';
import 'package:news_mobile/models/user_model.dart';

class NewsModel {
  int? id;
  String? title;
  String? article;
  String? image;
  int? userId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  CategoryModel? category;
  UserModel? user;

  NewsModel(
      {this.id,
      this.title,
      this.article,
      this.image,
      this.userId,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.user});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    article = json['article'];
    image = json['image'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['article'] = this.article;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
