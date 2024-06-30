import 'dart:convert';

// Constants
const String EMAIL = 'email';
const String PASSWORD = 'password';
const String D_TYPE = 'dType';
const String NAME = 'name';
const String MOBILE_NUMBER = 'mobileNumber';
const String ADDRESS = 'address';
const String AGE = 'age';
const String SPECIALIZATION = 'specialization';
const String ROLE = 'role';
const String DESCRIPTION = 'description';
const String EXPERIENCE = 'experience';
const String DISEASE = 'disease';

class PersonCredentials {
  final String email;
  final String password;
  final String? dType;
  final String? name;
  final String? mobileNumber;
  final String? address;
  final String? age;
  final String? specialization;
  final String? role;
  final String? description;
  final int? experience;
  final String? disease;
    final String? id;


  PersonCredentials({
    required this.email,
    required this.password,
    this.dType,
    this.name,
    this.mobileNumber,
    this.address,
    this.age,
    this.specialization,
    this.role,
    this.description,
    this.experience,
    this.disease,
    this.id
  });

  @override
  String toString() {
    return 'PersonCredentials { '
        'email: $email, '
        'password: $password, '
        'dType: $dType, '
        'name: $name, '
        'mobileNumber: $mobileNumber, '
        'address: $address, '
        'age: $age, '
        'id:${id},'
        'specialization: $specialization, '
        'role: $role, '
        'description: $description, '
        'experience: $experience, '
        'disease: $disease }';
  }

  static PersonCredentials fromJson(Map<String, dynamic> json) {
    return PersonCredentials(
      id:json['id'],
      email: json[EMAIL],
      password: json[PASSWORD],
      dType: json[D_TYPE],
      name: json[NAME],
      mobileNumber: json[MOBILE_NUMBER].toString() ,
      address: json[ADDRESS],
       age: json[AGE].toString(),
      specialization: json[SPECIALIZATION],
      role: json[ROLE],
      description: json[DESCRIPTION],
      experience: json[EXPERIENCE],
      disease: json[DISEASE],
    );
  }

   static PersonCredentials emptyObj() {
    return PersonCredentials(
      email: '',
      password: '',
      dType: '',
      name: '',
      mobileNumber: '',
      address: '',
      age: '',
      specialization: '',
      role: '',
      description: '',
      experience: 0,
      disease: '',
      id: '',
    );
  }

  static PersonCredentials tpObj(String name,String age,String desc) {
    return PersonCredentials(
      email: '',
      password: '',
      dType: '',
      name: name,
      mobileNumber: '',
      address: '',
      age: age,
      specialization: '',
      role: '',
      description: desc,
      experience: 0,
      disease: '',
      id: '',
    );
  }

 
}
