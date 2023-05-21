import 'package:flutter/material.dart';
import 'package:news_mobile/models/news_model.dart';
import 'package:news_mobile/screens/news/detail/news_detail_screen.dart';
import 'package:news_mobile/utils/constants/constants.dart';
import 'package:news_mobile/utils/functions/date_formatter.dart';

class NewsListItemWidget extends StatelessWidget {
  final NewsModel newsModel;
  const NewsListItemWidget({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(
              newsModel: newsModel,
            ),
          ),
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: 60,
        width: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            Constants.IMAGE_URL + newsModel.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        newsModel.title!,
      ),
      subtitle: _NewsDateWidget(newsModel: newsModel),
    );
  }
}

class _NewsDateWidget extends StatelessWidget {
  const _NewsDateWidget({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    String date = DateFormatter.getTimeDifference(
      DateTime.parse(newsModel.createdAt!),
    );

    return Text("${newsModel.user!.name!}  - ${date}");
  }
}
