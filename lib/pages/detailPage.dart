import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  List list;
  int index;

  detailPage(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    String ad = list[index].data()["name"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ad),
      ),
    );
  }
}