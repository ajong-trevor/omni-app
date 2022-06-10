import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tours_provider.dart';
import './tour_item.dart';

class TourList extends StatelessWidget {
  const TourList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tourData = Provider.of<ToursProvider>(context);
    final tour = tourData.items;
    return ListView.builder(
      itemCount: tour.length,
      itemBuilder: (context, index) {
        return TourItem(
          tourId: tour[index].id,
          tourUrl: tour[index].url,
          tourTitle: tour[index].tourTitle,
          tourLocation: tour[index].location,
          tourDescription: tour[index].description,
        );
      },
    );
  }
}
