import 'package:daily_news/app/module/home/submodules/top_news/top_news_controller.dart';
import 'package:daily_news/app/utils/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class TopNewsPage extends StatefulWidget {

  @override
  _TopNewsPageState createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage> {
  ScrollController _scrollController;
  final controller = Modular.get<TopNewsController>();

  @override
  void initState() {
    _scrollController = new ScrollController()
      ..addListener(() {
        if (_scrollController.position.extentAfter == 0 &&
            !controller.loadMore) {
          controller.addMoreItem();
        }
      });
    super.initState();
  }


  String formatTimestamp(int timestamp) {
    var format = new DateFormat('dd-MM-yyyy');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return format.format(date);
  }

  showAlertDialog1(BuildContext context, ItemModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Author: " + item.by ?? 'Anonymous', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                Padding(
                  padding: const EdgeInsets.only(top:8.0, bottom: 5),
                  child: Text("Data: " + formatTimestamp(item.time), style: TextStyle(fontWeight: FontWeight.w500),),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: "News: " ,
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(text: item.title ?? '',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                          )
                        ]
                    ),
                  ),
                )

              ]),

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: Observer(builder: (_) {
          if (controller
              .favoriteController.news == null || controller
              .favoriteController.news.isEmpty) {
            return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange,
                ));
          }
          return Container(
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .favoriteController.news.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                width: double.infinity,
                                child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          controller
                                              .favoriteController.news[index]
                                              .title.isEmpty
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
                                                          controller
                                                              .favoriteController
                                                              .news[index]);
                                                    },
                                                    child: Text(
                                                      controller
                                                          .favoriteController
                                                          .news[index].title,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      maxLines: 3,
                                                    ),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 8),
                                                child: InkWell(
                                                    onTap: () =>
                                                    controller
                                                        .favoriteController
                                                        .news[index]
                                                        .favorite
                                                        ? null
                                                        : controller
                                                        .favoriteController
                                                        .setFavorites(
                                                        index),
                                                    child: Icon(
                                                      controller
                                                          .favoriteController
                                                          .news[index]
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
                        controller.loadMore
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                            : Container(),
                        Container(
                          height: 10,
                        )
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
