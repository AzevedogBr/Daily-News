import 'dart:async';
import 'dart:convert';
import 'package:daily_news/app/utils/models/login_model.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final SharedService _shared;

  _SplashScreenControllerBase(this._shared) {
    getLoginPath();
  }

  @observable
  LoginModel login;

  void navigationToNextPage() {
    Modular.to.pushReplacementNamed('/home');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }


  getLoginPath() async {
    try {
      var list = await _shared.getLogin('user');
      if (list != null) {
        login = LoginModel.fromJson(json.decode(list));
        Modular.to.pushReplacementNamed('/home');
      }
      else {
        Modular.to.pushReplacementNamed('/login');
      }
    } catch (e) {
      rethrow;
    }
  }

}
