import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// import '../providers/tours_provider.dart';
import '../helpers/getx_switch_state.dart';

class UserTransactionScreen extends StatefulWidget {
  static const routName = '/user-transaction';

  @override
  State<UserTransactionScreen> createState() => _UserTransactionScreenState();
}

class _UserTransactionScreenState extends State<UserTransactionScreen> {
  bool _makePayment = false;

  final GetXSwitchState getXSwitchState = Get.put(GetXSwitchState());

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
              GetBuilder<GetXSwitchState>(builder: (_) {
                return Switch(
                  activeTrackColor: Theme.of(context).primaryColor,
                  value: getXSwitchState.isSwitched,
                  onChanged: (value) {
                    getXSwitchState.changeSwitchState(value);
                  },
                );
              })
            ]),
      ),
    );
  }
}
