import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_mobile/models/news_model.dart';
import 'package:news_mobile/utils/constants/constants.dart';
import 'package:news_mobile/utils/functions/date_formatter.dart';
import 'package:news_mobile/utils/style/components/text.dart';
import 'package:news_mobile/utils/style/theme/custom_theme.dart';
import 'package:news_mobile/utils/style/widgets/appbar/custom_appbar_widget.dart';
import 'package:news_mobile/utils/style/widgets/news/news_list_item_widget.dart';

class NewsDetailScreen extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetailScreen({super.key, required this.newsModel});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              Constants.IMAGE_URL + widget.newsModel.image!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: CustomTheme.screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponents.newsTitleText(
                  widget.newsModel.title!,
                ),
                const SizedBox(height: 14),
                _NewsDateAndUserDetailWidget(
                  newsModel: widget.newsModel,
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                SelectableText(
                  widget.newsModel.article!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NewsDateAndUserDetailWidget extends StatelessWidget {
  final NewsModel newsModel;
  const _NewsDateAndUserDetailWidget({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 34,
              width: 34,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  Constants.IMAGE_URL + newsModel.user!.profilePhotoPath!,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              newsModel.user!.name!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Text(
          DateFormat('yyyy-MM-dd HH:MM').format(
            DateTime.parse(
              newsModel.createdAt!,
            ),
          ),
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(.8),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
