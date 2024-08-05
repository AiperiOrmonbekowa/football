//   import 'package:dio/dio.dart';
// import 'package:football/constants/api/api_const.dart';
// import 'package:football/features/data/model/game_model.dart';


// class Games{
// Future<List<Game>> fetchGames() async {
//     final dio = Dio();
//     final response = await dio.get(ApiConst.adress); 
//     if (response.statusCode == 200) {
//       List<dynamic> data = response.data['results'];
//       return data.map((game) => Game.fromJson(game),
//       ).toList();
//     } else {
//       throw Exception('Failed to load games');
//     }
//   }
// }
