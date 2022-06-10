import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/user_login_details.dart';
import '../widgets/user_login.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/user-profile';

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var _isLogin = false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          _isLogin = false;
        });
      } else {
        setState(() {
          _isLogin = true;
        });
      }
    });

    var appBar = AppBar(
      title: Text(_isLogin ? 'Profile' : 'Log in'),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              1.0,
          child: _isLogin ? const UserLoginDetails() : const UserLogin(),
        ),
      ),
    );
  }
}
