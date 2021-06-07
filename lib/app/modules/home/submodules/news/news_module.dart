import 'package:daily_news/app/modules/home/repository/repository.dart';
import 'package:daily_news/app/modules/home/submodules/news/news_controller.dart';
import 'package:daily_news/app/modules/home/submodules/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewsController()),
      ];



  @override
  // TODO: implement view
  Widget get view => NewsPage();
}
