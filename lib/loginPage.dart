import 'package:flutter/material.dart';
import 'package:my_project/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;
  final _formKey = GlobalKey<FormState> ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Kullanıcı Adı "),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Kullanıcı Adı Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Şifre"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Şifrenizi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value;
                },
              ),

            _buton(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buton() => RaisedButton(child: Text("Giriş Yap"), onPressed: () {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: username ,)));

    }
  });
}


