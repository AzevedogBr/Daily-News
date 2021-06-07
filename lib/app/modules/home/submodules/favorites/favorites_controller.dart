import 'package:daily_news/app/modules/home/home_controller.dart';
import 'package:daily_news/app/utils/models/daily_news_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  _FavoritesControllerBase(){
    getFavorites();
  }

  HomeController _homeController = Modular.get<HomeController>();


  @observable
  List<News> favoriteNews = [];

  getFavorites() {
    favoriteNews = _homeController.saveApiFake.news.where((element) => element.favorite == true).toList();
  }
}