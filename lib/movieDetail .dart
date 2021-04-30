import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'header.dart';


class movieDetailPage extends StatefulWidget {
  final String movieTitle;
  final String photoUrl;


  movieDetailPage(this.movieTitle, this.photoUrl);

  @override
  _movieDetailPageState createState() => _movieDetailPageState();
}

class _movieDetailPageState extends State<movieDetailPage> {
  List<String> oyuncular = ["Oyuncu1","Oyuncu2","Oyuncu3",];
  List<String> yonetmen = ["Yönetmen"];

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
                  header(widget.movieTitle, context),
                  SizedBox(height: 32),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(
                        children: [
                          SizedBox(height: 0),
                          Center(child: Image.asset("assets/images/batman.jpg")),
                          SizedBox(height: 30),
                          Text(
                            'Yönetmeni : $yonetmen ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(height: 16),
                          SizedBox(height: 32),
                          Text(
                            'Oyuncuları : $oyuncular',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(height: 16),
                          SizedBox(height: 370),
                          GestureDetector(
                            onTap: () {
                             Navigator.pushNamed(context, "/hakkindaSayfasi");
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xFF1F53E4),
                              ),
                              child: Text(
                                'Hakkında Sayfası',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
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
