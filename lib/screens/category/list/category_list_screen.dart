import 'package:flutter/material.dart';
import 'package:news_mobile/models/category_model.dart';
import 'package:news_mobile/utils/enums/screen_status.dart';
import 'package:news_mobile/utils/style/components/text.dart';
import 'package:news_mobile/utils/style/theme/custom_theme.dart';
import 'package:news_mobile/utils/style/widgets/appbar/custom_appbar_widget.dart';
import 'package:news_mobile/utils/style/widgets/category/category_list_item_widget.dart';
import 'package:news_mobile/utils/style/widgets/loading/loading_widget.dart';
import 'package:news_mobile/view_model/category/caregory_view_model.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  void asyncInit() async {
    var provider = Provider.of<CategoryViewModel>(context, listen: false);
    await provider.getCategories(context);
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
            : RefreshIndicator(
                onRefresh: () => provider.getCategories(context),
                child: ListView(
                  children: [
                    TextComponents.titleText("Kategoriler"),
                    const SizedBox(height: 15),
                    CategoryItemBuilder(provider: provider)
                  ],
                ),
              ),
      ),
    );
  }
}

class CategoryItemBuilder extends StatelessWidget {
  const CategoryItemBuilder({
    super.key,
    required this.provider,
  });

  final CategoryViewModel provider;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.categories.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        CategoryModel categoryModel = provider.categories[index];
        return CategoryListItemWidget(
          categoryModel: categoryModel,
        );
      },
    );
  }
}
