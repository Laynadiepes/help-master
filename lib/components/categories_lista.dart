import 'package:flutter/material.dart';
import 'package:help_projeto/utils/constants.dart';

import '../models/categoryModel.dart';
import '../utils/routes.dart';

class CategoriesList extends StatelessWidget {
  final List categories;

  const CategoriesList(this.categories, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              categories.length,
              (index) {
                final ct = categories[index];
                return Column(
                  children: [
                    GestureDetector(
                      child: Card(
                        shadowColor: subTextColor,
                        elevation: 5,
                        child: SizedBox(
                          width: 100,
                          height: 70,
                          child: Image.asset(ct.url, fit: BoxFit.fitHeight),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.category_page,
                          arguments: categories[index],
                        );
                      },
                    ),
                    Text(
                      ct.title,
                      style: const TextStyle(color: textColor),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
