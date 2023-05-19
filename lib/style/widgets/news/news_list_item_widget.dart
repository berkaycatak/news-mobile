import 'package:flutter/material.dart';
import 'package:news_mobile/screens/news/detail/news_detail_screen.dart';

class NewsListItemWidget extends StatelessWidget {
  const NewsListItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(),
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
            "https://i.hbrcdn.com/manset/2023/05/19/esinin-memleketine-transfer-oldu-dirar-in-yeni_15928984_22.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        "Yapay Zeka Destekli Robotlar Tarım Sektöründe Çalışacak",
      ),
      subtitle: Text("Berkay Çatak  - 20.05.2023 00:44"),
    );
  }
}
