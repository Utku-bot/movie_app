import 'package:flutter/material.dart';
import 'package:my_project/category.dart';
import 'package:my_project/header.dart';


void main() {
  runApp(categoriesPage());
}

final List<String> categories = [
  "Hepsi",
  "AKSİYON",
  "KORKU",
  "BİLİMKURGU",
  "DRAM",
  "BELGESEL"
];

class categoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(" ", context),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: ListView(
                    children: categories
                        .map((String title) => buildCategories(title, context))
                        .toList(),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCategories(String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryPage(title);
      }));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 4)
          ]),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
