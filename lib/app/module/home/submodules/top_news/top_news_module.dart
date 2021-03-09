import 'package:daily_news/app/module/home/submodules/top_news/top_news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class TopNewsModule extends WidgetModule {
  @override
  List<Bind> get binds => [

  ];

  static Inject get to => Inject<TopNewsModule>.of();

  @override
  Widget get view => TopNewsPage();
}
