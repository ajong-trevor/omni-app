// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

import '../models/tour.dart';

class ToursProvider with ChangeNotifier {
  final List<Tour> _items = [
    Tour(
      id: 'tour001',
      categoryId: 'cat001',
      tourTitle: 'G-Block UB',
      location: 'Buea',
      url: 'assets/images/GBlock-UB.jpg',
      isPaid: false,
      tourUrl: 'https://test-hosting-8c73e.firebaseapp.com/',
      description:
          'Uinveristy of Buea description Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repudiandae dolor tenetur saepe, voluptatum voluptatibus architecto, odio ad dolore ab quas corporis, nostrum hic quo quis deserunt cumque consectetur. Voluptates ipsum tempora omnis cumque voluptatibus corrupti similique nobis saepe vitae magnam possimus modi quia nesciunt incidunt delectus totam enim illum et neque est nulla, aperiam harum ducimus! Numquam nemo aliquam dolores consequuntur id expedita, error possimus aliquid quibusdam voluptatem rem cumque explicabo magni maiores nulla obcaecati eos sed illum cupiditate recusandae quo maxime commodi culpa consequatur! Reprehenderit asperiores iusto inventore! Autem quidem assumenda dolorem magnam, nostrum quisquam aspernatur aperiam omnis asperiores.',
    ),
    // Tour(
    //   id: 'tour004',
    //   categoryId: 'cat005',
    //   tourTitle: 'Unmanned Veh Lab',
    //   location: 'Buea',
    //   url: 'assets/images/GBlock-UB.jpg',
    //   isPaid: false,e.firebaseapp.com/',
    //   description:
    //       'Unmanned Vehicle Laboratory description Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repudiandae dolor tenetur saepe, voluptatum voluptatibus architecto, odio ad dolore ab quas corporis, nostrum hic quo quis deserunt cumque consectetur. Voluptates ipsum tempora omnis cumque voluptatibus corrupti similique nobis saepe vitae magnam possimus modi quia nesciunt incidunt delectus totam enim illum et neque est nulla, aperiam harum ducimus! Numquam nemo aliquam dolores consequuntur id expedita, error possimus aliquid quibusdam voluptatem rem cumque explicabo magni maiores nulla obcaecati eos sed illum cupiditate recusandae quo maxime commodi culpa consequatur! Reprehenderit asperiores iusto inventore! Autem quidem assumenda dolorem magnam, nostrum quisquam aspernatur aperiam omnis asperiores.',
    // ),
  ];

  List<Tour> get items {
    return [..._items];
  }

  // Future<void> fetchAndSetTours() asy
  //   tourUrl: 'https://test-hosting-8c73nc {
  //   var url =
  //       Uri.parse('https://omni-tour-default-rtdb.firebaseio.com/tours.json');
  //   try {
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //     final List<Tour> loadedTours = [];
  //     extractedData.forEach((tourId, tourData) {
  //       loadedTours.add(Tour(
  //         id: tourId,
  //         categoryId: tourData['categoryId'],
  //         description: tourData['description'],
  //         location: tourData['location'],
  //         tourTitle: tourData['title'],
  //         url: tourData['imageUrl'],
  //         tourUrl: tourData['tourUrl'],
  //       ));
  //     });
  //     _items = loadedTours;
  //     notifyListeners();
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  void togglePayment() {
    _items.forEach((element) {
      element.isPaid = !element.isPaid;
    });
    notifyListeners();
  }
}
