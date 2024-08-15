import 'package:dio/dio.dart';
import 'package:football/constants/api/api_const.dart';
import 'package:football/features/data/model/game/game_model.dart';
import 'package:location/location.dart';

class GameService{
  final Location location = Location();
    Future<List<Game>> fetchGames() async {
      final locationData = await location.getLocation();
    final dio = Dio();
    final response = await dio.get(ApiConst.adress, queryParameters: {'latitude':locationData.latitude,
     'longitude': locationData.longitude}); 
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
  return data.map((game) => Game.fromJson(game)).toList();
    }else {
      throw Exception('Failed to load games');
    }
  }
}