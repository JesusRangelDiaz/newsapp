import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/models.dart';
import 'package:http/http.dart' as http;

const _baseUrl = 'newsapi.org';
const _apikey = '5b636d98a53841f494bb65f01ed8b6fb';

class NewsService with ChangeNotifier{
  List<Article> headlines =[];

  String _selectedCategory ='business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building,'business'),
    Category(FontAwesomeIcons.tv,'entertainment'),
    Category(FontAwesomeIcons.addressCard,'general'),
    Category(FontAwesomeIcons.headSideVirus,'health'),
    Category(FontAwesomeIcons.vials,'science'),
    Category(FontAwesomeIcons.volleyball,'sports'),
    Category(FontAwesomeIcons.memory,'technology'),
  ];

  Map<String, List<Article>> categoryArticles ={};

  NewsService(){
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor){
    _selectedCategory =valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  get getArticulosCategoriaSeleccionada =>categoryArticles[selectedCategory];

  getTopHeadlines() async{
    final  url = Uri.http(_baseUrl,'/v2/top-headlines',{'apiKey' : _apikey, 'country' : 'mx'});
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async{
    if(categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }

    final  url = Uri.http(_baseUrl,'/v2/top-headlines',{'apiKey' : _apikey, 'country' : 'mx', 'category':category});
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}