import 'package:daily_news/app/modules/login/login_controller.dart';
import 'package:daily_news/app/modules/login/login_page.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:daily_news/app/utils/store/form_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => SharedService(SharedPreferences.getInstance())),
    Bind((i) => FormStore()),
    Bind((i) => LoginController(i.get<SharedService>(), i.get<FormStore>())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => LoginPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}

