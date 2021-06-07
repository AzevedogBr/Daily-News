import 'package:daily_news/app/utils/end_points.dart';
import 'package:daily_news/app/utils/models/daily_news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Repository extends Disposable {
  Dio client = Dio();


  Future <DailyNewsModel> getNews() async {
    try {
      final response = await client.get('${Endpoint.BASE_URL}/data.json');
      var items = DailyNewsModel.fromJson(response.data);
      return items;
    } catch (e) {
      rethrow;
    }
  }



  @override
  void dispose() {}
}