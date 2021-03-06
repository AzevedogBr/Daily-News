import 'package:daily_news/app/module/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => HomePage()),
  ];
}