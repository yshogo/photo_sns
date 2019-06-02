import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("サインアップ"),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "email"),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: "password"),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: (){
                String email = _emailController.text;
                String password = _passwordController.text;

              },
              child: Text("サインアップ"),
            )
          ],
        ),
      ),
    );
  }

  Future<FirebaseUser> _signUp(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(user);
    return user;
  }

  Future<void> _saveUid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", uid);
  }
}
