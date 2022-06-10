import 'package:flutter/material.dart';

import './user_profile_screen.dart';
import './user_transaction_screen.dart';

class TourSettingsScreen extends StatelessWidget {
  final List<String> settingTitle = [
    'Profile',
    'Transaction',
    'Terms and Policy',
    'About',
    'Help',
  ];

  final List<Icon> settingIcon = const [
    Icon(
      Icons.account_circle,
      size: 30,
      color: Colors.pinkAccent,
    ),
    Icon(
      Icons.paid,
      size: 30,
      color: Colors.teal,
    ),
    Icon(
      Icons.description,
      size: 30,
      color: Colors.amberAccent,
    ),
    Icon(
      Icons.groups,
      size: 30,
      color: Colors.greenAccent,
    ),
    Icon(
      Icons.help,
      size: 30,
      color: Colors.orange,
    ),
  ];

  void selectSetting(String setting, context) {
    if (setting == 'Profile') {
      Navigator.of(context).pushNamed(UserProfileScreen.routeName);
    } else if (setting == 'Transaction') {
      Navigator.of(context).pushNamed(UserTransactionScreen.routName);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: settingTitle.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  onPressed: () => selectSetting(settingTitle[index], context),
                  child: Container(
                    height: 70,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            settingIcon[index],
                            const SizedBox(width: 20),
                            Text(
                              settingTitle[index],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ]),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black26,
                          ),
                        ]),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
