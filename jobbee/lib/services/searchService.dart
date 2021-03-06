import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/model.dart/job.dart';
import 'package:http/http.dart' as http;
import 'package:jobbee/model.dart/work.dart';

class SearchService {
  static Future<List<Work>> getJobs(String query) async {
    http.Response res = await http.get(Uri.parse('$url/api/home-job'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    if (res.statusCode == 200) {
      final List jobs = json.decode(res.body);

      return jobs.map((json) => Work.fromMap(json)).where((job) {
        final position = job.position.toLowerCase();

        final searchLower = query.toLowerCase();

        return position.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
