import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_sns/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "password",
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                _signIn(email, password).then((FirebaseUser user) {
                  _saveUid(user.uid).then((value) {
                    print("Sign in success");
                    Navigator.pop(context);
                  });
                });
              },
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

  Future<FirebaseUser> _signIn(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print("User id is ${user.uid}");
    return user;
  }

  Future<void> _saveUid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", uid);
  }
}
