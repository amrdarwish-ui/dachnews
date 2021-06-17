import 'package:dachnews/Models/Article.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class API {
  final apiKey = "161e5be74b954e13baf98e4c9da86834";
  Future<List<Article>> fetchNews() async {
    var url = "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey";
    var response = await http.get(url);
    var responsebody;
    if (response.statusCode == 200) {
      responsebody = json.decode(response.body)["articles"];
    }
    List<Article> list = [];
    for (var i in responsebody) {
      Article article = Article(
          title: i["title"], url: i["url"], urlToImage: i["urlToImage"]);
      list.add(article);
    }
    return list;
  }

  Future<List<Article>> fetchCategories(String catigoryname) async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=eg&category=$catigoryname&apiKey=$apiKey";
    var response = await http.get(url);
    var responsebody;
    if (response.statusCode == 200) {
      responsebody = json.decode(response.body)["articles"];
    }
    List<Article> list = [];
    for (var i in responsebody) {
      Article article = Article(
          title: i["title"], url: i["url"], urlToImage: i["urlToImage"]);
      list.add(article);
    }
    return list;
  }
}
