import 'package:daily_news/app/modules/login/login_controller.dart';
import 'package:daily_news/app/modules/login/submodule/singup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends ModularState<SingUpPage, SingUpController> {
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
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Text('Cadastre-se',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff6F967E),
                            fontWeight: FontWeight.w600
                       ),),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'e-mail'),
                      validator: controller.store.validatorEmail,
                      controller: controller.emailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'usuário'),
                      validator: controller.store.validatorString,
                      controller: controller.userController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'senha'),
                      validator: controller.store.validatorString,
                      controller: controller.passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: controller.sendSingUp,
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
                                              'Cadastrar',
                                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                                            )),
                                  width: controller.clickSave ? 50 : 200,
                                  height: 50,
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: Color(0xff6F967E),
                                      borderRadius: controller.clickSave ? BorderRadius.circular(50) : null),
                                )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: InkWell(
                          onTap: controller.goBack,
                          child: Text('Voltar',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue),)),
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
