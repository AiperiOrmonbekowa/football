class LatLongModel{
LatLongModel({required this.latitude, required this.longitude});

 final  double longitude;
 final  double latitude;

   factory LatLongModel.fromJson(Map<String, dynamic> json) {{
    return LatLongModel(latitude: json['latitude'], longitude:json['longitude'],);
   }
   }
}