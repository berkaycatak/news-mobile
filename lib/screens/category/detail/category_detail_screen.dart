import 'package:flutter/material.dart';
import 'package:news_mobile/style/components/text.dart';
import 'package:news_mobile/style/theme/custom_theme.dart';
import 'package:news_mobile/style/widgets/appbar/custom_appbar_widget.dart';
import 'package:news_mobile/style/widgets/news/news_list_item_widget.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: CustomTheme.screenPadding,
        child: ListView(
          children: [
            TextComponents.titleText("Teknoloji Haberleri"),
            SizedBox(height: 10),
            NewsListItemWidget(),
          ],
        ),
      ),
    );
  }
}
