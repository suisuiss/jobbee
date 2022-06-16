import 'package:flutter/material.dart';
import '../modell/company.dart';

class CompanyTab extends StatelessWidget {
  final company = CompanyInfo.myCompany;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          // ignore: prefer_const_constructors
          Text(
            "About Company",
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(company.aboutCompany,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                height: 1.5,
                color: Color(0xFF5B5B5B),
              )),
        ],
      ),
    );
  }
}
