import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Text("ログインする"),
            ),
          ],
        ),
      ),
    );
  }
}
