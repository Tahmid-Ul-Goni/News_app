import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_paper_project/Model/News.dart';
import 'package:news_paper_project/News%20home.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title:"The Daily Star",
      theme: ThemeData(primaryColor:Colors.blue),
      home:NewsHome(),
      
    );
  }
}

