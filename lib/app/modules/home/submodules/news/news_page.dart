import 'package:daily_news/app/modules/home/home_controller.dart';
import 'package:daily_news/app/modules/home/submodules/news/news_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widget/favorite_icon.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller?.saveApiFake?.news == null) {
          return Center(child: Container(height: 50, width: 50, child: CircularProgressIndicator()));
        }
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Notícias',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.saveApiFake.news.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  controller.saveApiFake.news[index].user.name,
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
                                        controller.saveApiFake.news[index].user.profilePicture,
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
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller.saveApiFake.news[index].message.content,
                                              softWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller.saveApiFake.news[index].message.dateBR,
                                              textAlign: TextAlign.right,
                                            ),
                                            FavoriteIcon(newItem: controller.saveApiFake.news[index])
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
      },
    );
  }
}
