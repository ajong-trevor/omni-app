import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../helpers/getx_switch_state.dart';
import '../screens/tour_screen.dart';
import '../providers/tours_provider.dart';
import '../screens/user_profile_screen.dart';

class TourDetailsScreen extends StatefulWidget {
  static const routeName = '/tour-details';

  @override
  State<TourDetailsScreen> createState() => _TourDetailsScreenState();
}

class _TourDetailsScreenState extends State<TourDetailsScreen> {
  // var _isInit = true;
  var _isLoading = false;
  var _isLogin = false;
  final GetXSwitchState getXSwitchState = Get.put(GetXSwitchState());

  void _openTour(BuildContext context, id) {
    Navigator.of(context).pushNamed(
      TourScreen.routeName,
      arguments: id,
    );
  }

  @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<ToursProvider>(context, listen: false)
  //         .fetchAndSetTours()
  //         .then((_) {
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

    final tourData = Provider.of<ToursProvider>(context, listen: false);
    final tourId = ModalRoute.of(context)?.settings.arguments as String?;
    final selectedTour =
        tourData.items.firstWhere((tourItem) => tourItem.id == tourId);

    final alertBox = AlertDialog(
      title: const Text("You're logged out!"),
      content: const Text(
        'Kindly login to start the tour',
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'No',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            Navigator.of(context).pushNamed(UserProfileScreen.routeName);
          },
          child: Text(
            'Yes',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );

    final messageBox = AlertDialog(
      title: const Text("Free trial over!"),
      content: const Text(
        'You have exhausted your free trial, make payment and get full access.',
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            'Okay',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTour.tourTitle),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(selectedTour.url),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  selectedTour.tourTitle,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    selectedTour.location,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ]),
                              ]),
                          Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_isLogin == false) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => alertBox,
                                  );
                                } else if ((getXSwitchState.isFreeTrialOver ==
                                        true) &&
                                    (getXSwitchState.isSwitched == false)) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => messageBox,
                                  );
                                } else {
                                  _openTour(context, selectedTour.id);
                                }
                              },
                              child: const Text(
                                'Start Tour',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 35,
                          ),
                          child: Text(
                            selectedTour.description,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 40,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_isLogin == false) {
                          showDialog(
                            context: context,
                            builder: (ctx) => alertBox,
                          );
                        } else if ((getXSwitchState.isFreeTrialOver == true) &&
                            (getXSwitchState.isSwitched == false)) {
                          showDialog(
                            context: context,
                            builder: (ctx) => messageBox,
                          );
                        } else {
                          _openTour(context, selectedTour.id);
                        }
                      },
                      child: const Text(
                        'Start Tour',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
