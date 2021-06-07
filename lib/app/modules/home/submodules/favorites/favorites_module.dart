import 'package:daily_news/app/modules/home/submodules/favorites/favorites_controller.dart';
import 'package:daily_news/app/modules/home/submodules/favorites/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FavoritesController()),
      ];

  static Inject get to => Inject<FavoritesModule>.of();

  @override
  // TODO: implement view
  Widget get view => FavoritesPage();
}
