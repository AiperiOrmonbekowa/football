
import 'package:dio/dio.dart';
import 'package:football/constants/api/api_const.dart';
import 'package:football/features/data/model/game_detail/game_detail.dart';

class GameDetailService {
  Future<GameDetail?> fetchGameDetail() async {
    final dio = Dio();

      final response = await dio.get(ApiConst.detail);
      if (response.statusCode == 200) {
       final details = GameDetail(description: response.data['description'], longitude: response.data['longitude'], latitude:response.data['latitude']);
       return details;
      }
      return null;}

}



