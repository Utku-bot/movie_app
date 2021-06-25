import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailPage.dart';

class moviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Favori Filmlerim '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  var map;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var filmlerRef = _firestore.collection("Filmler");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: filmlerRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
              if (asyncsnapshot.hasError) {
                return Center(
                  child: Text("bir hata oluştu"),
                );
              } else {
                if (asyncsnapshot.hasData) {
                  List listOfDocumentSnap = asyncsnapshot.data.docs;
                  return Flexible(
                    child: ListView.builder(
                      itemCount: listOfDocumentSnap.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.blue[200],
                            child: ListTile(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) =>
                                        detailPage(listOfDocumentSnap, index),
                                  ),
                                );
                              },
                              subtitle: Text(
                                  "${listOfDocumentSnap[index].data()["year"]}"),
                              isThreeLine: true,
                              trailing: Animator(
                                tween: Tween<double>(begin: 1, end: 0),
                                builder: (context, state, child) {
                                  return FractionalTranslation(
                                      child: child,
                                      translation: Offset(state.value, 0));
                                },
                                child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      await listOfDocumentSnap[index]
                                          .reference
                                          .delete();
                                    }),
                              ),
                              leading: IconButton(
                                icon: Icon(Icons.movie),
                              ),
                              title: Text(
                                "${listOfDocumentSnap[index].data()["name"]}",
                                style: GoogleFonts.londrinaShadow(fontSize: 34),
                              ),
                            ));
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "name"),
                ),
                TextFormField(
                  controller: yearController,
                  decoration: InputDecoration(hintText: "year"),
                ),
              ],
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Map<String, dynamic> movieData = {
            "name": nameController.text,
            "year": yearController.text
          };

          await filmlerRef.doc(nameController.text).set(movieData);
        },
      ),
    );
  }
}
