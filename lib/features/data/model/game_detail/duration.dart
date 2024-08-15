class Duration {
  double? hours;
  double? minutes;

  Duration({this.hours, this.minutes});

  Duration.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['hours'] = hours; 
    data['minutes']= minutes;
    return data;
  }
}