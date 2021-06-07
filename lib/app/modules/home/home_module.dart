import 'package:daily_news/app/modules/home/home_controller.dart';
import 'package:daily_news/app/modules/home/home_page.dart';
import 'package:daily_news/app/modules/home/repository/repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => Repository()),
    Bind((i) => HomeController(i.get<Repository>())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}