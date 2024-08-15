class Booking {

  final DateTime startDate;
  final Duration duration;

  Booking({
  
    required this.startDate,
    required this.duration,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(

      startDate: DateTime.parse(json['start_date']),
      duration: Duration(
      hours: json['duration']['hours'] ,
      minutes: json['duration']['minutes'],

      ),
    );
  }


}