import 'package:flutter/material.dart';
import 'package:news_mobile/style/components/text.dart';
import 'package:news_mobile/style/theme/custom_theme.dart';
import 'package:news_mobile/style/widgets/appbar/custom_appbar_widget.dart';
import 'package:news_mobile/style/widgets/news/news_list_item_widget.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

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
              "https://i.hbrcdn.com/manset/2023/05/19/esinin-memleketine-transfer-oldu-dirar-in-yeni_15928984_22.jpg",
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
                  "Barcelona, Şampiyonlar Ligi'nde Yarı Finale Yükseldi",
                ),
                const SizedBox(height: 14),
                Row(
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
                              "https://media.licdn.com/dms/image/D4D03AQGBCIafiP2JHg/profile-displayphoto-shrink_800_800/0/1682967634454?e=1689811200&v=beta&t=h5UePbmy1aE_P4a0eaiujk8CZIm4i-aXWtJl6cA-iW8",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Berkay Çatak",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(.8),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "20.05.2023 00:44",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const SelectableText(
                  "Barcelona Futbol Kulübü, mücadele dolu bir maç sonucunda Şampiyonlar Ligi'nde yarı finale yükselmeyi başardı. Messi'nin gösterdiği muhteşem performans ve takımın hücumdaki etkileyici oyunuyla Barcelona, rakibi Bayern Münih'i 3-2 mağlup ederek büyük bir zafer elde etti.",
                  style: TextStyle(
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
