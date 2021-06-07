import 'package:daily_news/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/flappy_dash.gif',
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'Digite seu usuário'),
                        validator: controller.store.validatorString,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Digite sua senha'),
                      obscureText: true,
                      validator: controller.store.validatorPassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: controller.checkLogin,
                        child: Observer(
                            builder: (_) => AnimatedContainer(
                              child: Center(
                                  child: controller.clickSave
                                      ? Container(
                                      height: 40,
                                      width: 40,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ))
                                      : Text(
                                    'Entrar',
                                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                                  )),
                              width: controller.clickSave ? 50 : 200,
                              height: 50,
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(color: Color(0xff6F967E), borderRadius: controller.clickSave ? BorderRadius.circular(50) : null),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: InkWell(
                          onTap: controller.goSingUp,
                          child: Text('Criar conta', style: TextStyle(fontSize: 14, color: Colors.blue),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                          onTap: controller.resetUser,
                          child: Text('Apagar usuário', style: TextStyle(fontSize: 14, color: Colors.blue),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
