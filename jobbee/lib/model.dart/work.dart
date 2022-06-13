import 'dart:convert';

class Work {
  final String?id;
  final String companyName;
  final String images;
  final String position;
  final String salary;
  final String fullOrPart;
  final String online;
  final String jobRes;
  final String benefits;
  final String companyDesc;
  final String location;

  Work(
      {this.id,
      required this.companyName,
      required this.images,
      required this.position,
      required this.salary,
      required this.fullOrPart,
      required this.online,
      required this.jobRes,
      required this.benefits,
      required this.companyDesc,
      required this.location});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyName': companyName,
      'images': images,
      'position': position,
      'salary': salary,
      'fullOrPart': fullOrPart,
      'online': online,
      'jobRes': jobRes,
      'benefits': benefits,
      'companyDesc': companyDesc,
      'location': location
    };
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
        id: map['_id'],
        companyName: map['companyName'] ?? '',
        images: map['images'] ?? '',
        position: map['position'] ?? '',
        salary: map['salary'] ?? '',
        fullOrPart: map['fullOrPart'] ?? '',
        online: map['online'] ?? '',
        jobRes: map['jobRes'] ?? '',
        benefits: map['benefits'] ?? '',
        companyDesc: map['companyDesc'] ?? '',
        location: map['location'] ?? '');
  }

  String toJson() => json.encode(toMap());
  factory Work.fromJson(String source) => Work.fromMap(json.decode(source));
}
