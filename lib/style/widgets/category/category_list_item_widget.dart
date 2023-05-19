import 'package:flutter/material.dart';
import 'package:news_mobile/screens/category/detail/category_detail_screen.dart';

class CategoryListItemWidget extends StatelessWidget {
  final String image;
  final String categoryName;

  const CategoryListItemWidget({
    super.key,
    required this.image,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoryDetailScreen(),
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
                image,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          Text(
            categoryName,
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
