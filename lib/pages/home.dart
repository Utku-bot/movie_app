import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/utku/AndroidStudioProjects/my_project/lib/pages/categories_.dart';
import 'file:///C:/Users/utku/AndroidStudioProjects/my_project/lib/pages/moviePage.dart';

import 'izleyeceğim.dart';

class HomePage extends StatefulWidget {
  final username;

  const HomePage({Key key, @required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
             "${widget.username}  Hoşgeldiniz"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: ListView(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Text(
                      'Günün Filmleri',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildMoviesItem(
                        photoUrl: "assets/images/interstellar.jpg",
                        screenWidth: screenWidth,
                      ),
                      buildMoviesItem(
                        photoUrl: "assets/images/avatar.jpg",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildMoviesItem(
                        photoUrl: "assets/images/batman.jpg",
                        screenWidth: screenWidth,
                      ),
                      buildMoviesItem(
                        photoUrl: "assets/images/split.jpg",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildNavigation(
                            text: 'Film Türleri',
                            icon: Icons.add,
                            widget: categoriesPage(),
                            context: context),

                        buildNavigation(
                            text: 'Favori Filmlerim',
                            icon: Icons.add,
                            widget: moviePage(),
                            context: context),
                        buildNavigation(
                            text: 'İzleyeceğim Filmler',
                            icon: Icons.add,
                            widget: App(),
                            context: context),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Center(
      child: Text(
        'Hoşgeldiniz',
        style: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildNavigation(
    {@required String text,
    @required IconData icon,
    Widget widget,
    BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ));
    },
    child: Column(
      children: [
        Container(
          width: 100,
          padding: EdgeInsets.all(20),
          child: Icon(icon, color: Colors.indigo, size: 30),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, color: Colors.blueAccent),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
              color: Colors.indigo, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildMoviesItem({String photoUrl, @required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22),
        Center(
          child: Image.asset(photoUrl),
        ),
      ],
    ),
  );
}
