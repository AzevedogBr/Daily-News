import 'package:daily_news/app/module/home/home_controller.dart';
import 'package:daily_news/app/module/home/repositories/repository.dart';
import 'package:daily_news/app/utils/models/item_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'top_news_controller.g.dart';

class TopNewsController = _TopNewsControllerBase with _$TopNewsController;

abstract class _TopNewsControllerBase with Store {
  _TopNewsControllerBase() {
    getListIds();
  }

  var favoriteController = Modular.get<HomeController>();

  HackNewRepository repo = HackNewRepository();

  @observable
  List<int> newsListIds = [];

  @observable
  bool loadMore = false;

  @observable
  int newsLimit = 0;

  @action
  addMoreItem() {
    loadMore = !loadMore;
    getListItem();
  }



  void getListIds() async {
    try {
      loadMore = !loadMore;
      var response = await repo.getListOfHackNew();
      newsListIds = response;
      getListItem();
    } catch (e) {
      loadMore = !loadMore;
      rethrow;
    }
  }

  @action
  getListItem() async {
    try {
      newsLimit = newsLimit + 12;
      getNews(newsListIds, newsLimit).then((listOfArticles) {
        List<ItemModel> listOfNews = favoriteController.news;
        listOfArticles.forEach((newsArticle) {
          listOfNews.add(newsArticle);
        });
        favoriteController.news =listOfNews;
        favoriteController.news = favoriteController.news;
        loadMore = !loadMore;
      });
    } catch (e) {
      loadMore = !loadMore;
      rethrow;
    }
  }

  Future<List<ItemModel>> getNews(List newsIdList, int indexRange) async {
    try {
      List<ItemModel> listOfNews = [];
      for (int index = (indexRange - 12); index < indexRange; index++) {
        ItemModel news =
            await fetchNews(int.parse(newsIdList[index].toString()));
        if (news != null) {
          listOfNews.add(news);
        }
      }
      return listOfNews;
    } catch (e) {
      loadMore = !loadMore;
      rethrow;
    }
  }

  Future<ItemModel> fetchNews(int newsId) async {
    try {
      final response = await repo.getItem(newsId);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
