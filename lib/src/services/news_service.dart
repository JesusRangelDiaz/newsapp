import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'newsapi.org';
const _apikey = '5b636d98a53841f494bb65f01ed8b6fb';

class NewsService with ChangeNotifier{
  List<Article> headlines =[];

  NewsService(){
    getTopHeadlines();
  }

  getTopHeadlines() async{
    final  url = Uri.http(_baseUrl,'/v2/top-headlines',{'apiKey' : _apikey, 'country' : 'mx'});
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}