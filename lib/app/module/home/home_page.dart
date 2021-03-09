import 'package:daily_news/app/module/home/home_controller.dart';
import 'package:daily_news/app/module/home/submodules/favorite/favorites_module.dart';
import 'package:daily_news/app/module/home/submodules/top_news/top_news_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'widget/bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [TopNewsModule(), FavoritesModule()],
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
                label: 'Search',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
