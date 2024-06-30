class AvailabilitySlot {
  String time;
  bool isAvailable;

  AvailabilitySlot({
    required this.time,
    required this.isAvailable,
  });

  static  AvailabilitySlot fromJson(Map<String, dynamic> json) {
    return AvailabilitySlot(
      time: json['time'],
      isAvailable: json['isAvailable'],
    );
  }

    String toString() {
    return 'AvailabilitySlot { time: $time, isAvailable: $isAvailable }';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}