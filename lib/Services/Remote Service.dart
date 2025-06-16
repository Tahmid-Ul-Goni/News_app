import 'dart:convert';

import 'package:news_paper_project/Model/News.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<Comment?> getNews() async {
    var client= http.Client();
    var uri= Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2025-02-28&sortBy=publishedAt&apiKey=9d4da3b5605e4384bb42d999037f1a18');
     var response= await client.get(uri);
     if( response.statusCode == 200){
       var data = jsonDecode(response.body);
       return Comment.fromJson(data);
     }else { return null;}
  }
}