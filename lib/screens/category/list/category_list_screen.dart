import 'package:flutter/material.dart';
import 'package:news_mobile/style/components/text.dart';
import 'package:news_mobile/style/theme/custom_theme.dart';
import 'package:news_mobile/style/widgets/appbar/custom_appbar_widget.dart';
import 'package:news_mobile/style/widgets/category/category_list_item_widget.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: CustomTheme.screenPadding,
        child: ListView(
          children: [
            TextComponents.titleText("Kategoriler"),
            const SizedBox(height: 15),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CategoryListItemWidget(
                  categoryName: 'Spor',
                  image:
                      'https://i.hbrcdn.com/manset/2023/05/19/esinin-memleketine-transfer-oldu-dirar-in-yeni_15928984_22.jpg',
                ),
                SizedBox(height: 10),
                CategoryListItemWidget(
                  categoryName: 'Teknoloji',
                  image:
                      'https://i.hbrcdn.com/manset/2023/05/19/iste-turkiye-den-avrupa-kupalarina-katilacak_15928148_93.jpg',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
