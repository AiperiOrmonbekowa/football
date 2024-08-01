class Organizer {
  final int id;
  final String name;
  final String surname;
  final String username;
  final String phoneNumber;

  Organizer({required this.id, required this.name, required this.surname, required this.username, required this.phoneNumber});

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      username: json['username'],
      phoneNumber: json['phone_number'],
    );
  }
}