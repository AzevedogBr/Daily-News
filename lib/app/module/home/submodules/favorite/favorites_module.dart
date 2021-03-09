import 'package:daily_news/app/module/home/submodules/favorite/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesModule extends WidgetModule {
  @override
  List<Bind> get binds => [
    // Bind((i) => FavoritesController(), lazy: false),
  ];

  static Inject get to => Inject<FavoritesModule>.of();

  @override
  Widget get view => FavoritesPage();
}