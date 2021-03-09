import 'package:daily_news/app/app_widget.dart';
import 'package:daily_news/app/module/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', module: HomeModule()),
  ];

   @override
  Widget get bootstrap => AppWidget();
}