import 'package:daily_news/app/utils/models/item_model.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final SharedService _shared;
  _HomeControllerBase(this._shared){
    getFavoritesPath();
  }

  PageController pageController;

  @observable
  int page = 0;

  @observable
  int indexBar = 0;

  @observable
  List<ItemModel> favoritesPath = [];

  @observable
  bool savePath = false;

  @action
  changeIndexBar(int index){
    indexBar = index;
  }

  @observable
  List<ItemModel> news = [];

  @action
  setFavorites(int index) {
    try {
      news[index].favorite = !news[index].favorite;
      saveFavorites(news[index]);
      news = news;
    } catch (e) {
      rethrow;
    }
  }

  @action
  removeFavorites(int id, int index ){
    try {
      final item =
      news.firstWhere((element) => element.id == id, orElse: () => null);
      item.favorite = !item.favorite;
      news  = news;
      removeFavoritesPath(index);
    } catch (e) {
      removeFavoritesPath(index);
      rethrow;
    }
  }

  @action
  saveFavorites(ItemModel item) async {
    try {
      favoritesPath.add(item);
    } catch (e) {
      rethrow;
    }
  }

  @action
  removeFavoritesPath(int index) async {
    try {
      favoritesPath.removeAt(index);
    } catch (e) {
      rethrow;
    }
  }

  getFavoritesPath() async {
    try {
      String list = await _shared.getFavorite();
      if (list != null)
        favoritesPath = ObservableList.of(ItemModel.decode(list));
    } catch (e) {
      rethrow;
    }
  }

  @action
  saveFavoritesPath() async {
    savePath = !savePath;
    await Future.delayed(Duration(seconds: 3));
    try {
      String fav = ItemModel.encode(favoritesPath);
      await _shared.setFavorite(fav);
      savePath = !savePath;
    } catch (e) {
      savePath = !savePath;
      rethrow;
    }
  }




  @action
  void goToPage(int index) {
    page = index;
    pageController.jumpToPage(index);
  }

  bool isCurrentPage(int index) => (index == page);
}


