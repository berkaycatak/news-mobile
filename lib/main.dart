import 'package:flutter/material.dart';
import 'package:news_mobile/screens/category/list/category_list_screen.dart';
import 'package:news_mobile/view_model/category/caregory_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CategoryViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haberler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryListScreen(),
    );
  }
}
