import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/users.dart';

class UserLoginDetails extends StatefulWidget {
  const UserLoginDetails({Key? key}) : super(key: key);

  @override
  State<UserLoginDetails> createState() => _UserLoginDetailsState();
}

class _UserLoginDetailsState extends State<UserLoginDetails> {
  User? user = FirebaseAuth.instance.currentUser;

  Users loginUser = Users();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loginUser = Users.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.32,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/omni_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 25.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.52,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${loginUser.firstName} ${loginUser.lastName}",
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ]),
                    const Divider(height: 50.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${loginUser.email}",
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ]),
                    const Divider(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Phone",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "+237${loginUser.phone}",
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                    const Divider(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Status",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${loginUser.status}",
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                    const Divider(height: 50.0)
                  ],
                ),
                Container(
                  child: const Text('version 1.0'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
