import 'dart:convert';

class Job {
  final String? id;
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

  Job(
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
  Map<String, dynamic> toJson() {
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

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
        id: json['_id'],
        companyName: json['companyName'] ?? '',
        images: json['images'] ?? '',
        position: json['position'] ?? '',
        salary: json['salary'] ?? '',
        fullOrPart: json['fullOrPart'] ?? '',
        online: json['online'] ?? '',
        jobRes: json['jobRes'] ?? '',
        benefits: json['benefits'] ?? '',
        companyDesc: json['companyDesc'] ?? '',
        location: json['location'] ?? '');
  }
}
