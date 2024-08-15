

class GameDetail {
  final String description;
  final double longitude;
  final double latitude;
  final String? image;
   final String contribution;


  GameDetail(  {
    required this.description,
    required this.longitude,
    required this.latitude,
    this.image,
    required this.contribution,

  });

factory GameDetail.fromJson(Map<String, dynamic> json) {
  return GameDetail(
    description: json['description'],
    longitude: json['longitude'],
    latitude: json['latitude'],
    image: json['image'],
    contribution: json['contribution'],

  );
}
}

