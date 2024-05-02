import 'package:flutter/material.dart';
import 'package:shamia/helpers/navigator_key.dart';
import '../../../core/color.dart';

PreferredSizeWidget defaultAppBAr({back, tittle = 'h'}) => AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: kWhiteColor,
      elevation: 0.0,
      // title: Text(tittle, style: TextStyle(
      //   color: kbackGroundColor,
      //   fontSize: 20.0
      // ),),
      // leading: back
      //     ? IconButton(
      //         onPressed: () {
      //           RouteManager.pop();
      //         },
      //         icon: Icon(Icons.arrow_back))
      //     : null,
      actions: [
        Text(
          tittle,
          style: const TextStyle(color: kbackGroundColor, fontSize: 24.0),
        ),
        IconButton(
          onPressed: () {
            RouteManager.pop();
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: kbackGroundColor,
          ),
        ),
      ],
    );
