// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamia/core/svg_image.dart';
import '../../../core/color.dart';
import '../../../core/constant.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customSvg(name: 'no_internet'),
            Text(
              'No internet connection',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            heght10,
            Text(
              'Check your internet connection and then enter the app again',
              style: TextStyle(
                color: kSpecialTextFieldHintColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
