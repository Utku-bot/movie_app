import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class hakkindaSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hakkında Sayfası"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193311002 numaralı Utku ÇAKILCA tarafından 25 Haziran 2021 günü yapılmıştır."),
        ),
      ),
    );
  }
}
