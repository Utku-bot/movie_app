import 'package:flutter/material.dart';
import 'package:my_project/header.dart';
import 'movieDetail .dart';

class CategoryPage extends StatelessWidget {
 final String categoryTitle;
  CategoryPage(this.categoryTitle);

 final List<Map> movies = [
    {"isim": "Split", "fotograf": "assets/images/split.jpg","imbd" : "7.3"},
    {"isim": "Kara Şovalye", "fotograf": "assets/images/batman.jpg","imbd" : "9.0"},
    {"isim": "Avatar", "fotograf": "assets/images/avatar.jpg","imbd" : "7.8"},
    {"isim": "Interstellar", "fotograf": "assets/images/interstellar.jpg","imbd" : "8.6"},
    {"isim": "Avenger Endgame", "fotograf": "assets/images/avengerEndGame.jpg","imbd" : "8.4" },
    {"isim": "Inception", "fotograf": "assets/images/inception.jpg","imbd" : "8.8"}
  ];

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
                  header(categoryTitle, context),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 1,
                      children: movies.map((Map movies) {
                        return buildContent(movies["isim"],
                            movies["fotograf"], movies["imbd"], context);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildContent(String title, String photoUrl, String imbd, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return movieDetailPage(title,photoUrl);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Image.asset(photoUrl,scale: 1.5,),
          SizedBox(
            height: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF3a1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "IMBD : $imbd",
                style: TextStyle(
                    color: Color(0xFF3a1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),

            ],
          )
        ],
      ),
    ),
  );
}
