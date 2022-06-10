import 'package:flutter/material.dart';

import '../screens/tour_details_screen.dart';

class TourItem extends StatelessWidget {
  final String tourId;
  final String tourUrl;
  final String tourTitle;
  final String tourLocation;
  final String tourDescription;

  TourItem({
    required this.tourId,
    required this.tourUrl,
    required this.tourTitle,
    required this.tourLocation,
    required this.tourDescription,
  });

  void selectTour(BuildContext context) {
    Navigator.of(context).pushNamed(
      TourDetailsScreen.routeName,
      arguments: tourId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTour(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(children: <Widget>[
              Stack(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    tourUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    width: constraints.maxWidth * 1,
                    height: 180,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tourTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(children: <Widget>[
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              tourLocation,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ])
                        ]),
                  ),
                ),
              ]),
            ]);
          },
        ),
      ),
    );
  }
}
