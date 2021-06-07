import 'package:daily_news/app/app_widget.dart';
import 'package:daily_news/app/modules/home/home_module.dart';
import 'package:daily_news/app/modules/login/login_module.dart';
import 'package:daily_news/app/modules/login/submodule/singup_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash_screen/splash_screen_module.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', module: SplashScreenModule()),
    ModularRouter('/login', module: LoginModule()),
    ModularRouter('/home', module: HomeModule()),
    ModularRouter('/singup', module: SingUpModule()),

  ];

   @override
  Widget get bootstrap => AppWidget();
}