import 'dart:convert';

class User {
  final String id;
  final List<String> images;
  final String firstName;
  final String lastName;
  final String phoneNo;
  final String basedOn;
  final String disType;
  final String edLevel;
  final String eddetail;
  final String workEx;
  final String skill;
  final String email;
  final String password;
  final List<dynamic> favorite;
  final List<dynamic> applied;

  User(
      {required this.id,
      required this.images,
      required this.firstName,
      required this.lastName,
      required this.phoneNo,
      required this.basedOn,
      required this.disType,
      required this.edLevel,
      required this.eddetail,
      required this.workEx,
      required this.skill,
      required this.email,
      required this.password,
      required this.favorite,
      required this.applied});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'images': images,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNo': phoneNo,
      'basedOn': basedOn,
      'disType': disType,
      'edLevel': edLevel,
      'eddetail': eddetail,
      'workEx': workEx,
      'skill': skill,
      'email': email,
      'password': password,
      'favorite': favorite,
      'applied': applied
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] ?? '',
        images: List<String>.from(map['images']),
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        phoneNo: map['phoneNo'] ?? '',
        basedOn: map['basedOn'] ?? '',
        disType: map['disType'] ?? '',
        edLevel: map['edLevel'] ?? '',
        eddetail: map['eddetail'] ?? '',
        workEx: map['workEx'] ?? '',
        skill: map['skill'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        favorite: List<Map<String, dynamic>>.from(
            map['favorite']?.map((x) => Map<String, dynamic>.from(x))),
        applied: List<Map<String, dynamic>>.from(
            map['applied']?.map((x) => Map<String, dynamic>.from(x))));
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
User copyWith({
  String?id,
  List<String>?images,
  String?firstName,
  String?lastName,
  String?phoneNo,
  String?basedOn,
  String?disType,
  String?edLevel,
  String?eddetail,
  String?workEx,
String?skill,
String?email,
String?password,
List<dynamic>?favorite,
List<dynamic>?applied
})
  {
    return User(
      id: id??this.id,
      images: images??this.images,
      firstName:firstName?? this.firstName, 
      lastName:lastName??this.lastName, 
      phoneNo:phoneNo??this.phoneNo,
    basedOn: basedOn ?? this.basedOn,
        disType: disType ?? this.disType,
        edLevel: edLevel ?? this.edLevel,
        eddetail: eddetail ?? this.eddetail,
        workEx: workEx??this.workEx,
        skill: skill??this.skill,
        email: email??this.email,
        password: password??this.password,
        favorite: favorite??this.favorite,
        applied: applied??this.applied
    );
  }
}
