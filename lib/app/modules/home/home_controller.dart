import 'package:daily_news/app/modules/home/repository/repository.dart';
import 'package:daily_news/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:daily_news/app/utils/models/daily_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final Repository repo;

  _HomeControllerBase(this.repo) {
    pageController = PageController();
    getNews();
  }

  SplashScreenController _splashScreenController = Modular.get<SplashScreenController>();
  PageController pageController;
  TextEditingController controllerMessage = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @observable
  int page = 0;

  @observable
  int indexBar = 0;

  @observable
  DailyNewsModel saveApiFake = DailyNewsModel();

  Future<bool> setFavorite(News newItem) async {
    try {
      saveApiFake.news.forEach((element) {
        if (element.message == newItem.message) element.favorite = !element.favorite;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  sendNewMessage(BuildContext context) {
    if (formKey.currentState.validate()) {
      News newMessage = News(user: User(), message: Message(), favorite: false);
      newMessage.message.content = controllerMessage.text;
      newMessage.message.createdAt = DateTime.now();
      newMessage.user.name = _splashScreenController.login.name;
      newMessage.user.profilePicture = '';
      saveApiFake.news.add(newMessage);
      var newList = saveApiFake;
      saveApiFake = DailyNewsModel();
      newList.news.sort((a, b) => b.message.createdAt.compareTo(a.message.createdAt));
      saveApiFake = newList;
      Navigator.pop(context);
      controllerMessage.clear();
    }
  }

  getNews() async {
    if (saveApiFake.news == null) {
      var response = await repo.getNews();
      response.news.sort((a, b) => b.message.createdAt.compareTo(a.message.createdAt));
      saveApiFake = response;
    }
    saveApiFake.news.sort((a, b) => b.message.createdAt.compareTo(a.message.createdAt));
  }

  @action
  void goToPage(int index) {
    page = index;
    pageController.jumpToPage(index);
  }

  bool isCurrentPage(int index) => (index == page);
}
