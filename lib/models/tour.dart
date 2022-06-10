import 'package:flutter/cupertino.dart';

class Tour with ChangeNotifier {
  final String id;
  final String categoryId;
  final String tourTitle;
  final String location;
  final String url;
  final String description;
  final String tourUrl;
  bool isPaid;

  Tour({
    required this.id,
    required this.categoryId,
    required this.tourTitle,
    required this.location,
    required this.url,
    required this.description,
    required this.tourUrl,
    required this.isPaid,
  });
}
