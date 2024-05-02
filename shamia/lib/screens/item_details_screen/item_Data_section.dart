// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/core/constant.dart';
import 'package:shamia/screens/categories/data/models/category_item_model.dart';

class ItemDataSection extends StatelessWidget {
  const ItemDataSection({
    super.key,
    required this.categoryItem,
  });

  final CategoryItem? categoryItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .2,
        ),
        Text(
          categoryItem!.title!.ar!,
          maxLines: 1,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26.0,
            color: kbackGroundColor,
            fontFamily: 'Expo Arabic',
          ),
        ),
        Text(
          categoryItem!.description!.ar!,
          maxLines: 1,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
            fontFamily: 'Expo Arabic',
          ),
        ),
        heght20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ر.س ${categoryItem!.price}',
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                fontFamily: 'Expo Arabic',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
