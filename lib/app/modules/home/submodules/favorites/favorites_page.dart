import 'package:daily_news/app/modules/home/home_controller.dart';
import 'package:daily_news/app/modules/home/submodules/favorites/favorites_controller.dart';
import 'package:daily_news/app/modules/home/submodules/news/widget/favorite_icon.dart';
import 'package:daily_news/app/utils/models/daily_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ModularState<FavoritesPage, FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.favoriteNews == null) {
        return Center(
          child: Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        );
      } else if (controller.favoriteNews.isEmpty) {
        return Center(
            child: Container(
          child: Text('Ainda não há favoritos'),
        ));
      } else {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Meus Fapvitos',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.favoriteNews.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  controller.favoriteNews[index].user.name,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        controller.favoriteNews[index].user.profilePicture,
                                      ),
                                      radius: 20,
                                    )
                                  ],
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.favoriteNews[index].user.name,
                                        softWrap: true,
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        controller.favoriteNews[index].message.content,
                                        softWrap: true,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller.favoriteNews[index].message.dateBR,
                                              textAlign: TextAlign.right,
                                            ),
                                            FavoriteIcon(newItem: controller.favoriteNews[index])
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                              ]),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }
    });
  }
}
