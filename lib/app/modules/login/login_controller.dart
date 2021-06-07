import 'package:daily_news/app/utils/boat_toast/feed_back_helper.dart';
import 'package:daily_news/app/utils/models/login_model.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:daily_news/app/utils/store/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final FormStore store;
  final SharedService _shared;

  _LoginControllerBase(this._shared, this.store);

  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @observable
  bool clickSave = false;

  LoginModel login = LoginModel();

  setLogin() {
    login.name = loginController.text;
    login.password = passwordController.text;
  }

  goSingUp() {
    Modular.to.pushNamed('singup');
    formKey.currentState.reset();
  }


  Future getAPI() async{
    return await new Future.delayed(Duration(seconds: 2));
    }

  resetUser() {
    try {
      _shared.cleanAll();
      FeedbackHelper.simpleFeedback(message: 'Usuário removido com sucesso', feedbackType: FeedbackType.success, showAboveNavBar: false);
    } catch(e) {
      FeedbackHelper.simpleFeedback(message: 'Erro ao excluir, tente novamente.', feedbackType: FeedbackType.warning, showAboveNavBar: false);
    }
  }

  checkLogin() async {
    if (store.formIsValid(formKey)) {
      clickSave = !clickSave;
      await getAPI();
      setLogin();
      FocusScope.of(Modular.navigatorKey.currentContext).requestFocus(FocusNode());
      try {
        var list = await _shared.getLogin('user');
        if (list != null) {
          Modular.to.pushReplacementNamed('/home');
          clickSave = !clickSave;
          FeedbackHelper.simpleFeedback(message: 'Você está logado', feedbackType: FeedbackType.success, showAboveNavBar: false);
        } else {
          clickSave = !clickSave;
          FeedbackHelper.simpleFeedback(message: 'Usuário não encontrado', feedbackType: FeedbackType.warning, showAboveNavBar: false);
        }
      } catch (e) {
        clickSave = !clickSave;
        FeedbackHelper.simpleFeedback(message: e, feedbackType: FeedbackType.warning);
        rethrow;
      }
    }
  }
}
