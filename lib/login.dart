import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_sns/sign_up.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("ログイン画面"),
            TextFormField(
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "password",
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("ログイン"),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => SignUp(),
                ));
              },
              child: Text(
                "サインアップ",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
