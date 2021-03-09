import 'package:daily_news/app/module/home/home_controller.dart';
import 'package:daily_news/app/utils/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  HomeController controllerFavorites = Modular.get<HomeController>();

  showAlertDialog1(BuildContext context, ItemModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Author: " + item.by ?? 'Anonymous'),
          content: Text("News: " + item.title ?? ''),
        );
      },
    );
  }

  final snackBar = SnackBar(
    content: Text('Seus favoritos foram salvos com sucesso!!', textAlign: TextAlign.center,),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
          actions: [
            Observer(
              builder: (_) {
                return Row(
                  children: [
                    Text('Salvar'),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: InkWell(
                          onTap: () {
                            controllerFavorites.saveFavoritesPath();
                            Scaffold.of(context).showSnackBar(snackBar);
                            },
                          child: controllerFavorites.savePath
                              ? Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      )),
                                )
                              : Icon(Icons.save, size: 30)),
                    )
                  ],
                );
              },
            )
          ],
        ),
        body: Observer(builder: (_) {
          print(controllerFavorites.favoritesPath);
          if (controllerFavorites.favoritesPath == null ||
              controllerFavorites.favoritesPath.isEmpty) {
            return Center(child: Text('Você ainda não possui favoritos'));
          }
          return Container(
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controllerFavorites.favoritesPath.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                // height: 30,
                                width: double.infinity,
                                child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          controllerFavorites
                                                  .favoritesPath[index]
                                                  .title
                                                  .isEmpty
                                              ? Container()
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        child: InkWell(
                                                          onTap: () {
                                                            showAlertDialog1(
                                                                context,
                                                                controllerFavorites
                                                                    .favoritesPath[index]);
                                                          },
                                                          child: Text(
                                                      controllerFavorites
                                                            .favoritesPath[index]
                                                            .title,
                                                      overflow:
                                                            TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                    ),
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      child: InkWell(
                                                          onTap: () {
                                                            controllerFavorites.removeFavorites(controllerFavorites.favoritesPath[index].id, index);
                                                          },
                                                          child: Icon(
                                                            controllerFavorites
                                                                    .favoritesPath[
                                                                        index]
                                                                    .favorite
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border,
                                                            color: Colors
                                                                .deepOrange,
                                                          )),
                                                    )
                                                  ],
                                                )
                                        ],
                                      ),
                                    )),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
