import 'package:daily_news/app/modules/user/user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends ChildModule {

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) =>  UserPage()),



  ];
  static Inject get to => Inject<UserModule>.of();
}