import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobbee/constant/constant.dart';
import 'package:jobbee/constant/errorhandling.dart';
import 'package:jobbee/constant/utils.dart';
import 'package:jobbee/model.dart/user.dart';
import 'package:jobbee/model.dart/work.dart';
import 'package:jobbee/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class FavoriteService {
  void favorite({required BuildContext context, required Work work}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(Uri.parse('$url/api/job/favorite'),
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'x-auth-token':userProvider.user.token
          },
          body: jsonEncode({'id': work.id!}));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User user = userProvider.user
                .copyWith(favorite: jsonDecode(res.body)['favorite']);
            userProvider.setUserFromModel(user);
            showSnackBar(context, 'Added to Favorite!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
