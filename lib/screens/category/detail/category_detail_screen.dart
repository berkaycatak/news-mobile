import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_mobile/models/category_model.dart';
import 'package:news_mobile/models/news_model.dart';
import 'package:news_mobile/utils/enums/screen_status.dart';
import 'package:news_mobile/utils/style/components/text.dart';
import 'package:news_mobile/utils/style/theme/custom_theme.dart';
import 'package:news_mobile/utils/style/widgets/appbar/custom_appbar_widget.dart';
import 'package:news_mobile/utils/style/widgets/loading/loading_widget.dart';
import 'package:news_mobile/utils/style/widgets/news/news_list_item_widget.dart';
import 'package:news_mobile/view_model/category/caregory_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryDetailScreen({super.key, required this.categoryModel});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  void asyncInit() async {
    var provider = Provider.of<CategoryViewModel>(context, listen: false);
    await provider.getCategoryDetail(context, widget.categoryModel.id!);
  }

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryViewModel>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: CustomTheme.screenPadding,
        child: provider.screenStatus == ScreenStatus.LOADING
            ? const LoadingWidget()
            : ListView(
                children: [
                  TextComponents.titleText(
                    "${widget.categoryModel.name} Haberleri",
                  ),
                  const SizedBox(height: 10),
                  NewsBuilder(
                    categoryModel: widget.categoryModel,
                  ),
                ],
              ),
      ),
    );
  }
}

class NewsBuilder extends StatelessWidget {
  final CategoryModel categoryModel;

  const NewsBuilder({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryViewModel>(context);
    if (provider.category.news == null) {
      return const Text("Hiç haber bulunamadı");
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.category.news!.length,
      itemBuilder: (context, index) {
        NewsModel newsModel = provider.category.news![index];
        return NewsListItemWidget(
          newsModel: newsModel,
        );
      },
    );
  }
}
