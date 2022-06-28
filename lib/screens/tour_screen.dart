import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../providers/tours_provider.dart';
import '../helpers/getx_switch_state.dart';
import './user_transaction_screen.dart';

class TourScreen extends StatefulWidget {
  const TourScreen({Key? key}) : super(key: key);

  static const routeName = '/tour-screen';

  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  // var _isInit = true;
  // var _isLoading = false;
  var showAlert = false;
  bool? paymentStatus;
  static const maxSecond = 30;
  int seconds = maxSecond;
  Timer? timer;
  final GetXSwitchState getXSwitchState = Get.put(GetXSwitchState());

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  void startTimer() {
    final tourId = ModalRoute.of(context)?.settings.arguments as String?;
    final tourData = Provider.of<ToursProvider>(context, listen: false);
    final tour = tourData.items.firstWhere((tourItem) => tourId == tourItem.id);
    paymentStatus = tour.isPaid;
    if (paymentStatus == false) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (seconds > 0) {
          seconds--;
          print(seconds);
        } else {
          stopTimer();
        }
      });
    }
  }

  void stopTimer() {
    timer?.cancel();
    if ((seconds == 0) && (getXSwitchState.isSwitched == false)) {
      setState(() {
        showAlert = true;
        getXSwitchState.isFreeTrialOver = true;
      });
      print('show alert box');
    }
  }

  @override
  void didChangeDependencies() {
    startTimer();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
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
    final tourId = ModalRoute.of(context)?.settings.arguments as String?;
    final tourData = Provider.of<ToursProvider>(context, listen: false);
    final tour = tourData.items.firstWhere((tourItem) => tourId == tourItem.id);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: showAlert
          ? AlertDialog(
              title: const Text("Free trial over!"),
              content: const Text("Make payment and get full access?"),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.of(context)
                        .pushNamed(UserTransactionScreen.routName);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            )
          : WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: tour.tourUrl,
            ),
    );
  }
}
