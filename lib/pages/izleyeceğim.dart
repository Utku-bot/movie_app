import 'package:flutter/material.dart';

import 'izlenecek_list_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2,child: izlenecekListPage(),),
    );
  }
}
