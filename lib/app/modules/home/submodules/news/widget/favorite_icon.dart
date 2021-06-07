import 'package:daily_news/app/modules/home/home_controller.dart';
import 'package:daily_news/app/utils/enum.dart';
import 'package:daily_news/app/utils/models/daily_news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteIcon extends StatefulWidget {
  final News newItem;
  const FavoriteIcon({Key key,this.newItem,}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool favorite = false;
  var controller = Modular.get<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    favorite = widget.newItem.favorite;
    super.initState();
  }

  changeFavorite() {
    controller.setFavorite(widget.newItem);
    setState(() {
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(onTap: changeFavorite, child: Icon(favorite ? Icons.favorite : Icons.favorite_border, size: 20, color: Color(0xff6F967E))),
    );
  }
}
