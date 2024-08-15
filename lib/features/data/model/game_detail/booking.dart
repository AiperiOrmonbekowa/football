

class Booking {
  final int id;
  final String address;
  final dynamic arbitrator;
  final int bookingType;
  final DateTime startDate;
  final int fieldType;
  final String paymentStatus;
  final int footballFieldCost;
  final int dayOfWeek;
  final Duration duration;

  Booking({
    required this.id,
    required this.address,
    required this.arbitrator,
    required this.bookingType,
    required this.startDate,
    required this.fieldType,
    required this.paymentStatus,
    required this.footballFieldCost,
    required this.dayOfWeek,
    required this.duration,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] ?? 0,
      address: json['address'] ?? '',
      arbitrator: json['arbitrator'],
      bookingType: json['booking_type'] ?? 0,
      startDate: DateTime.parse(json['start_date'] ?? ''),
      fieldType: json['field_type'] ?? 0,
      paymentStatus: json['payment_status'] ?? '',
      footballFieldCost: (json['football_field_cost'] as num).toInt(),
      dayOfWeek: json['day_of_week'] ?? 0,
      duration: Duration(
        hours: json['duration']['hours'] ?? 0,
        minutes: json['duration']['minutes'] ?? 0,
      ),
    );
  }
}

