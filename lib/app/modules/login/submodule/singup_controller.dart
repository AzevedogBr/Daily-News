import 'package:daily_news/app/utils/boat_toast/feed_back_helper.dart';
import 'package:daily_news/app/utils/models/user_model.dart';
import 'package:daily_news/app/utils/shared_preferences.dart';
import 'package:daily_news/app/utils/store/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'singup_controller.g.dart';

class SingUpController = _SingUpControllerBase with _$SingUpController;

abstract class _SingUpControllerBase with Store {
  final FormStore store;
  final SharedService _shared;

  _SingUpControllerBase(this.store, this._shared);

  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  UserModel user = UserModel();

  @observable
  bool clickSave = false;

  Future getAPI() async{
    return await new Future.delayed(Duration(seconds: 2));
  }

  setUser() {
    user.name = userController.text;
    user.email = emailController.text;
    user.password = passwordController.text;
  }

  goBack() {
    Modular.to.pop();
  }

  sendSingUp() async {
    if (store.formIsValid(formKey)) {
      FocusScope.of(Modular.navigatorKey.currentContext).requestFocus(FocusNode());
      clickSave = !clickSave;
      await getAPI();
      setUser();
      try {
        await _shared.save("user", user);
        Modular.to.pop();
        clickSave = !clickSave;
        FeedbackHelper.simpleFeedback(message: 'Cadastro realizado com sucesso', feedbackType: FeedbackType.success, showAboveNavBar: false);
      } catch (e) {
        clickSave = !clickSave;
        FeedbackHelper.simpleFeedback(message: e, feedbackType: FeedbackType.success, showAboveNavBar: false);
        rethrow;
      }
    }
  }


}