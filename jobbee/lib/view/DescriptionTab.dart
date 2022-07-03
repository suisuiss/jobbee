import 'package:flutter/material.dart';
import '../modell/company.dart';

class DescriptionTab extends StatelessWidget {
  final company = CompanyInfo.myCompany;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "Job Responsibilities",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF21202A),
              fontWeight: FontWeight.w400,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            company.jobOpportunity,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF21202A),
            ).copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            "Benefits",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF21202A),
              fontWeight: FontWeight.w400,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            company.jobResponsbilities,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF21202A),
            ).copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
           SizedBox(height: 25.0),
          Text(
            "Location",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF21202A),
              fontWeight: FontWeight.w400,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            company.city,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF21202A),
            ).copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
        ],
      ),
    );
  }
}
