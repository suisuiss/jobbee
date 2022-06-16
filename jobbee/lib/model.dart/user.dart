import 'dart:convert';

class User {
  final String id;

  final String firstName;
  final String lastName;
  final String phoneNo;
  final String basedOn;
  final String edLevel;
  final String eddetail;
  final String workEx;
  final String skill;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNo,
      required this.basedOn,
      required this.edLevel,
      required this.eddetail,
      required this.workEx,
      required this.skill,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNo': phoneNo,
      'basedOn': basedOn,
      'edLevel': edLevel,
      'eddetail': eddetail,
      'workEx': workEx,
      'skill': skill,
      'email': email,
      'password': password
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      basedOn: map['basedOn'] ?? '',
      edLevel: map['edLevel'] ?? '',
      eddetail: map['eddetail'] ?? '',
      workEx: map['workEx'] ?? '',
      skill: map['skill'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
