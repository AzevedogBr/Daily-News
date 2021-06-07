import 'package:daily_news/app/modules/splash_screen/splash_screen_page.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen_controller.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [
        Bind((i) => SharedService(SharedPreferences.getInstance())),
        Bind((i) => SplashScreenController(i.get<SharedService>()), lazy: true),
      ];

  @override
  List<ModularRouter> get routers =>
      [
        ModularRouter('/', child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}
