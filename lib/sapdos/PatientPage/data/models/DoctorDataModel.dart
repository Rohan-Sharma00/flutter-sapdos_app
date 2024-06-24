class User {
  final String greeting;
  final String name;
  final String avatar;

  User({
    required this.greeting,
    required this.name,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      greeting: json['greeting'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
class Doctor {
  final String doctorImage;
  final String doctorName;
  final String specialization;
  final String appointmentIcon;
  final int price;
  final double rating;
  final int totalRatings; 
  final String education;
  final String experience;
  final String description;

  Doctor({
    required this.doctorImage,
    required this.doctorName,
    required this.specialization,
    required this.appointmentIcon,
    required this.price,
    required this.rating,
    required this.totalRatings,
    required this.education,
    required this.experience,
    required this.description,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorImage: json['doctorImage'],
      doctorName: json['doctorName'],
      specialization: json['specialization'],
      appointmentIcon: json['appointmentIcon'],
      price: json['price'],
      rating: json['rating'].toDouble(),
      totalRatings: json['totalRatings'],
      education: json['education'],
      experience: json['experience'],
      description: json['description'],
    );
  }
}

class DataModel {
  final User user;
  final List<Doctor> doctorsList;

  DataModel({
    required this.user,
    required this.doctorsList,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      user: User.fromJson(json['user']),
      doctorsList: List<Doctor>.from(
          json['doctorsList'].map((doctor) => Doctor.fromJson(doctor))),
    );
  }
}
