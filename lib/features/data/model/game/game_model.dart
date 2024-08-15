import 'package:football/features/data/model/game/organizer_model.dart';

class Game {
  final int id;
  final double contribution;
  final int maxPlayer;
  final String title;
  final DateTime startDate;
  final Duration duration;
  final int existingPlayerCount;
  final String? description;
  final String? image;
  final double? distanceFromUser;
  final Organizer organizer;

  Game({
    required this.id,
    required this.contribution,
    required this.maxPlayer,
    required this.title,
    required this.startDate,
   required this.description,
    required this.duration,
    required this.existingPlayerCount,
   required this.distanceFromUser, 
    required this.organizer,
    this.image,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      description: json['description'],
      id: json['id'] is int ? json['id'] as int : (json['id'] as double).toInt(),
      contribution: json['contribution'] is String
          ? double.tryParse(json['contribution'] as String) ?? 0.0
          : json['contribution'] as double,
      maxPlayer: json['max_player'] is int ? json['max_player'] as int : (json['max_player'] as double).toInt(),
      title: json['title'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      duration: Duration(
        hours: json['duration']['hours'] is int
            ? json['duration']['hours'] as int
            : (json['duration']['hours'] as double).toInt(),
        minutes: json['duration']['minutes'] is int
            ? json['duration']['minutes'] as int
            : (json['duration']['minutes'] as double).toInt(),
      ),
      existingPlayerCount: json['existing_player_count'] is int
          ? json['existing_player_count'] as int
          : (json['existing_player_count'] as double).toInt(),
       distanceFromUser: json['distance_from_user'],
      organizer: Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
      image: json['image'] as String?,
    );
  }
 fetchGames() {}
}




