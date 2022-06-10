import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tours_provider.dart';

class UserTransactionScreen extends StatefulWidget {
  static const routName = '/user-transaction';

  @override
  State<UserTransactionScreen> createState() => _UserTransactionScreenState();
}

class _UserTransactionScreenState extends State<UserTransactionScreen> {
  bool _makePayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Toggle the switch ON to make payment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Switch(
                activeTrackColor: Theme.of(context).primaryColor,
                value: _makePayment,
                onChanged: (value) {
                  setState(() {
                    _makePayment = value;
                    Provider.of<ToursProvider>(context, listen: false)
                        .togglePayment();
                    print(_makePayment);
                  });
                },
              ),
            ]),
      ),
    );
  }
}
