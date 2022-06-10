import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/category_list.dart';
import '../widgets/tour_list.dart';
import './user_profile_screen.dart';
import '../providers/tours_provider.dart';

class TourListScreen extends StatefulWidget {
  @override
  State<TourListScreen> createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  var _isInit = true;
  var _isLoading = false;
  var _isLogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void selectPage(context) {
    Navigator.of(context).pushNamed(UserProfileScreen.routeName);
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
    Fluttertoast.showToast(msg: "Logout successful");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<ToursProvider>(context).fetchAndSetTours().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

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

    final appBar = AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () => selectPage(context),
          iconSize: 45,
          tooltip: 'Profile',
        );
      }),
      title: const Text(
        'OMNI',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () async {
            if (_isLogin == false) {
              Fluttertoast.showToast(msg: "You're already logged out");
            } else {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return _isLoading
                        ? const CircularProgressIndicator()
                        : AlertDialog(
                            title: const Text("Logging out!"),
                            content:
                                const Text("Are you sure you want to log out?"),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: Theme.of(ctx).primaryColor,
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  Navigator.of(context).pop(true);
                                  logoutUser().then((_) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  });
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Theme.of(ctx).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                  });
              // await logoutUser();
              // setState(() {
              //   _isLoading = false;
              // });
            }
          },
          icon: const Icon(Icons.logout),
          iconSize: 30,
          tooltip: 'Logout',
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: _isLoading
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.12,
                    child: CategoryList(),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.806,
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const TourList(),
                  ),
                ],
              ),
            ),
    );
  }
}
