import 'file:///C:/projetos/daily_news/lib/app/app_widget.dart';
import 'package:daily_news/app/module/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => HomePage()),
  ];

   @override
  Widget get bootstrap => AppWidget();
}