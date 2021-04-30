import 'package:flutter/material.dart';

Widget header(String title, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 29,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          size: 27,
          color: Color(0xFF0A1034),
        ),
      ),
      SizedBox(
        height: 24,
      ),
      Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A1034)),
        ),
      ),
    ],
  );
}
