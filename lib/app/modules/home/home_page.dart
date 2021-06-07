import 'package:daily_news/app/modules/home/home_controller.dart';
import 'package:daily_news/app/modules/home/submodules/favorites/favorites_module.dart';
import 'package:daily_news/app/modules/home/submodules/news/news_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'widget/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Form(
            key: controller.formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              TextFormField(
                controller: controller.controllerMessage,
                maxLength: 280,
                validator: (value) {
                  if (value.isEmpty || value.length < 20) return 'Digite uma mensagem';
                  return null;
                },
                decoration: InputDecoration(labelText: "Mensagem"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [InkWell(onTap: () => controller.sendNewMessage(ctx), child: Text('Enviar'))],
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [NewsModule(), FavoritesModule()],
        ),
        bottomNavigationBar: Observer(
          builder: (_) => Container(
            child: _bottomBar(
              controller: controller,
              tabs: [
                BottomBarModel(
                  index: 0,
                  icon: Icons.home,
                  iconOut: Icons.home_outlined,
                  label: 'Inicio',
                ),
                BottomBarModel(
                  index: 1,
                  icon: Icons.favorite,
                  iconOut: Icons.favorite_border,
                  label: 'Favoritos',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Observer(builder: (_) {
          return controller.page == 0
              ? FloatingActionButton(
                  onPressed: showAlertDialog,
                  child: Icon(Icons.add),
                )
              : Container();
        }));
  }
}
