// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/core/constant.dart';
import 'package:shamia/helpers/navigator_key.dart';
import 'package:shamia/screens/categories/data/models/category_item_model.dart';
import 'package:shamia/screens/item_details_screen/item_Data_section.dart';

class ItemDetailsScreen extends StatelessWidget {
  final CategoryItem? categoryItem;
  const ItemDetailsScreen({Key? key, required this.categoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbackGroundColor,
        leadingWidth: 80,
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white.withOpacity(.5)),
          child: Icon(Icons.favorite_border_outlined),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white.withOpacity(.5),
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.08,
              child: IconButton(
                onPressed: () {
                  RouteManager.pop();
                },
                iconSize: 20.0,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          width10,
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: kbackGroundColor,
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: kWhiteColor,
              ),
              margin:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .15),
              child: ItemDataSection(categoryItem: categoryItem),
            ),
            Positioned(
              top: -10,
              right: 40,
              child: Container(
                height: MediaQuery.sizeOf(context).height * .3,
                width: MediaQuery.sizeOf(context).width * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      image: NetworkImage(categoryItem!.images!.first.image!),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
