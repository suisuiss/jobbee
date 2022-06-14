import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/constant/errorhandling.dart';
import 'package:jobbee/constant/utils.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<Work>> fetchAllWorks(BuildContext context) async {
    List<Work>workList = [];
    try {
      http.Response res = 
      await http.get(Uri.parse('$url/api/home-job'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i<jsonDecode(res.body).length; i++) {
              workList.add(
                Work.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i]
                    
                  )
                )
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    } return workList;
  }
}
