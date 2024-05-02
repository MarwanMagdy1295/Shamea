// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/core/constant.dart';

GestureDetector itemCard({onTap, img, title, subTitle, price, context, id}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 15)
            ],
          ),
          margin:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: MediaQuery.sizeOf(context).height * .16,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.0),
              //     image:
              //         DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
              //   ),
              // ),
              heght60,
              Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: kbackGroundColor,
                  fontFamily: 'Expo Arabic',
                ),
              ),
              Text(
                '$subTitle',
                maxLines: 1,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  fontFamily: 'Expo Arabic',
                ),
              ),
              heght20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$price ر.س',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      fontFamily: 'Expo Arabic',
                    ),
                  ),
                  Icon(Icons.favorite_border_rounded)
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -30,
          right: 30,
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    ),
  );
}
