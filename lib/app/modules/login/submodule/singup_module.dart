import 'package:daily_news/app/modules/login/submodule/singup_page.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:daily_news/app/utils/store/form_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'singup_controller.dart';

class SingUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => FormStore()),
    Bind((i) => SharedService(SharedPreferences.getInstance())),
    Bind((i) => SingUpController(i.get<FormStore>(), i.get<SharedService>())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => SingUpPage()),
  ];

  static Inject get to => Inject<SingUpModule>.of();
}