import 'package:flutter/material.dart';
import 'package:news_mobile/models/category_model.dart';
import 'package:news_mobile/screens/category/detail/category_detail_screen.dart';
import 'package:news_mobile/utils/constants/constants.dart';

class CategoryListItemWidget extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryListItemWidget({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryListItemWidget> createState() => _CategoryListItemWidgetState();
}

class _CategoryListItemWidgetState extends State<CategoryListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(
              categoryModel: widget.categoryModel,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                Constants.IMAGE_URL + widget.categoryModel.image!,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          Text(
            widget.categoryModel.name!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
