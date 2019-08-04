import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _isLogin(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: LinearProgressIndicator(),
            );
          }

          bool isLogin = snapshot.data;
          if (isLogin) {
            return _mainContent(context);
          }
          return _login(context);
        },
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    return Center(
      child: Text("ログイン済みです"),
    );
  }

  Widget _login(BuildContext context) {
    return Center(
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
    );
  }

  Future<bool> _isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("uid") != null;
  }
}
