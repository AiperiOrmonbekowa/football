
import 'package:dio/dio.dart';
import 'package:football/constants/api/api_const.dart';
import 'package:football/features/data/model/game_detail/game_detail.dart';

class GameDetailService {
  Future<GameDetail?> fetchGameDetail() async {
    final dio = Dio();
    final response = await dio.get(ApiConst.detail);
    if (response.statusCode == 200) {
      final details = GameDetail.fromJson(response.data);
      return details;
    }
    return null;
  }

}



