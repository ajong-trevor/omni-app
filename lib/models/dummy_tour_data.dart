import 'package:flutter/material.dart';

import './tour.dart';
import './category.dart';

final List<Category> dummyCategoryData = [
  Category(
    id: 'cat001',
    categoryTitle: 'School',
    categoryIcon: const Icon(Icons.home_work, color: Colors.blue),
  ),
  Category(
    id: 'cat003',
    categoryTitle: 'Hotel',
    categoryIcon: const Icon(
      Icons.hotel,
      color: Colors.blue,
    ),
  ),
  Category(
    id: 'cat005',
    categoryTitle: 'Shop',
    categoryIcon: const Icon(Icons.local_grocery_store, color: Colors.blue),
  ),
  Category(
    id: 'cat006',
    categoryTitle: 'Resturant',
    categoryIcon: const Icon(Icons.storefront, color: Colors.blue),
  ),
  Category(
    id: 'cat002',
    categoryTitle: 'House',
    categoryIcon: const Icon(Icons.house, color: Colors.blue),
  ),
];
