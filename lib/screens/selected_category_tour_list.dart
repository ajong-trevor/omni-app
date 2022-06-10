import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tours_provider.dart';
import '../widgets/tour_item.dart';

class SelectedCategoryTourList extends StatefulWidget {
  final String selectedCategoryId;
  final String selectedCategoryTitel;

  SelectedCategoryTourList(this.selectedCategoryId, this.selectedCategoryTitel);

  @override
  State<SelectedCategoryTourList> createState() =>
      _SelectedCategoryTourListState();
}

class _SelectedCategoryTourListState extends State<SelectedCategoryTourList> {
  var _isInit = true;
  var _isLoading = false;

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
    final tourData = Provider.of<ToursProvider>(context, listen: false);
    final tour = tourData.items;
    final categoryTour = tour.where((tourItem) {
      return tourItem.categoryId.contains(widget.selectedCategoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedCategoryTitel),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : categoryTour.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Nothing to see here!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'No tours yet...',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: categoryTour.length,
                  itemBuilder: (context, index) {
                    return TourItem(
                      tourId: categoryTour[index].id,
                      tourUrl: categoryTour[index].url,
                      tourTitle: categoryTour[index].tourTitle,
                      tourLocation: categoryTour[index].location,
                      tourDescription: categoryTour[index].description,
                    );
                  }),
    );
  }
}
