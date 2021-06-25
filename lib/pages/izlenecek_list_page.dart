import 'package:flutter/material.dart';
import 'package:my_project/data/izlenecek_Service.dart';
import 'package:my_project/models/izlenecek.dart';
import 'package:my_project/pages/izlenecek_page.dart';

class izlenecekListPage extends StatefulWidget {
  @override
  _izlenecekListPageState createState() => _izlenecekListPageState();
}

class _izlenecekListPageState extends State<izlenecekListPage> {
  izlenecekService service = izlenecekService.instance;
  List<izlenecek> izlenecekler = [];
  List<izlenecek> izlenmisler = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("İzlenecekler Listesi"),
        bottom: TabBar(

          tabs: [
            Tab(
              icon: Icon(Icons.check_box_outline_blank),
            ),
            Tab(
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
      body: TabBarView(children: [
        getIzlenecekList(izlenecekler),
        getIzlenecekList(izlenmisler),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => izlenecekPage()))
              .then((value) => loadData());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getIzlenecekList(List<izlenecek> izlenecek) {
    return izlenecek.length == 0
        ? Center(child: Text("Liste Boş"))
        : ListView.builder(
            itemCount: izlenecek.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  trailing: Checkbox(

                    onChanged: (value) {
                      izlenecek[index].bittiMi=value;
                      service
                          .updateIsDone(izlenecek[index])
                          .then((value) => loadData());
                    },
                    value: izlenecek[index].bittiMi,
                  ),
                  title: Text(izlenecek[index].adi),
                  subtitle: Text(izlenecek[index].icerik),
                ),
              );
            },
          );
  }

  loadData() {
    service.getIzlenecek(true).then((value) {
      setState(() {
        izlenecekler = value;
      });
    });
    service.getIzlenecek(false).then((value) {
      setState(() {
        izlenmisler = value;
      });
    });
  }
}
