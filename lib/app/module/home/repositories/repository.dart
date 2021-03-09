import 'package:daily_news/app/utils/end_points.dart';
import 'package:daily_news/app/utils/models/item_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';


class HackNewRepository extends Disposable {
  Dio client = Dio();


  Future<List<int>> getListOfHackNew() async {
    try {
      final response = await client.get('${Endpoint.BASE_URL}/newstories.json');
      var items = List<int>.from(response.data.map((e) => e).toList());
      return items;
    } catch (e) {
      rethrow;
    }
  }

  Future<ItemModel> getItem(int id) async {
    try {
      final response = await client.get('${Endpoint.BASE_URL}/item/$id.json');
      var item = ItemModel.fromJson(response.data);
      if (item.title != null)
        return item;
      return null;
    } catch (e) {
      rethrow;
    }
  }


  @override
  void dispose() {}
}