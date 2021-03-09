import 'package:daily_news/app/module/home/home_controller.dart';
import 'package:daily_news/app/module/home/home_page.dart';
import 'package:daily_news/app/module/home/submodules/favorite/favorites_module.dart';
import 'package:daily_news/app/module/home/submodules/top_news/top_news_controller.dart';
import 'package:daily_news/app/module/home/submodules/top_news/top_news_module.dart';
import 'package:daily_news/app/splash/splash_screen.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<SharedService>()), lazy: true),
    Bind((i) => TopNewsController(), lazy: true),
    Bind((i) => SharedService(SharedPreferences.getInstance())),

  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => SplashScreen()),
    ModularRouter('/home', child: (_, args) => HomePage()),
    ModularRouter('/top', module: TopNewsModule()),
    ModularRouter('/favorites', module: FavoritesModule()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}