import 'package:flutter/material.dart';
import 'package:my_project/data/izlenecek_Service.dart';
import 'package:my_project/models/izlenecek.dart';

class izlenecekPage extends StatelessWidget {
  izlenecekService izlenecekServisi = izlenecekService.instance;
  final adController = TextEditingController();
  final icerikController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final adField = TextFormField(
      controller: adController,
      decoration: InputDecoration(
        hintText: "Film Adı",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
    final icerikField = TextFormField(
      controller: icerikController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: "İçeriği",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
    final saveButton = FlatButton(
      onPressed: () {
        izlenecekServisi.addIzlenecek(izlenecek(
            id: null,
            adi: adController.text,
            icerik: icerikController.text,
            bittiMi: false)).then((value) => Navigator.pop(context));
      },
      child: Text("Kaydet"),
      color: Colors.blue,
    );

    return Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title: Text("İzlenecek Film Ekleme Sayfası"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: adField,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icerikField,
            ),
            saveButton
          ],
        ));
  }
}
