import 'package:flutter/material.dart';

import '../models/dummy_tour_data.dart';
import '../screens/selected_category_tour_list.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  void selectCategory(String categoryid, String categoryTitle, context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return SelectedCategoryTourList(categoryid, categoryTitle);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategoryData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                side:
                    BorderSide(color: Theme.of(context).primaryColor, width: 1),
                shape: const StadiumBorder(),
              ),
              onPressed: () => selectCategory(
                dummyCategoryData[index].id,
                dummyCategoryData[index].categoryTitle,
                context,
              ),
              icon: dummyCategoryData[index].categoryIcon,
              label: Text(
                dummyCategoryData[index].categoryTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
