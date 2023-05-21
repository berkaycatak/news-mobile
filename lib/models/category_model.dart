import 'package:news_mobile/models/news_model.dart';

class CategoryModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<NewsModel>? news;

  CategoryModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.news});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['news'] != null) {
      news = <NewsModel>[];
      json['news'].forEach((v) {
        news!.add(new NewsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toDetailPayload() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    return data;
  }
}
