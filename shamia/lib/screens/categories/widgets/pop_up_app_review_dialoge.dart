// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/core/svg_image.dart';

Future<void> popUpAppReviewDialog(context, {int? userId}) {
  // var isNoClicked = false;
  // print('userId popUp### $userId');
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: SizedBox(
          height: MediaQuery.sizeOf(context).height * .34,
          // MediaQuery.sizeOf(context).height * .34,
          width: MediaQuery.sizeOf(context).width * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customSvg(name: 'done-rounded', height: 100.0, width: 100.0),
              // Text(
              //   'Help'.tr(),
              //   style: TextStyle(
              //     color: kSpecialHomeIcons,
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              SizedBox(
                height: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'review_app',
                    style: TextStyle(
                      color: kSpecialTextFieldHintColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    // child: customButton(
                    //   onTap: () {
                    //     OpenStore.instance.open(
                    //       appStoreId:
                    //           '6446490163', // AppStore id of your app for iOS
                    //       androidAppBundleId:
                    //           'com.secondOpnion', // Android app bundle package name
                    //     );
                    //     // Navigator.of(context).pop();
                    //     Navigator.of(context, rootNavigator: true)
                    //         .pop('dialog');
                    //   },
                    //   title: 'yes'.tr(),
                    //   TextColor: kWhiteColor,
                    //   bottomColor: kDeepBlueColor,
                    // ),
                  ),
                  SizedBox(
                    width: 100,
                    // child: customButton(
                    //   onTap: () {
                    //     // isNoClicked = true;
                    //   },
                    //   title: 'no'.tr(),
                    //   TextColor: kWhiteColor,
                    //   bottomColor: kDeepBlueColor,
                    // ),
                  ),
                ],
              ),
              // isNoClicked
              //     ?
              // SizedBox(
              //   height: 24.0,
              // ),
              // : Container(),
              // isNoClicked
              //     ?
              // TextFormField(
              //   // controller: cubit.allergyController,
              //   maxLines: 3,
              //   decoration: InputDecoration(
              //     hintText: 'Write your feedback....'.tr(),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide.none,
              //     ),
              //     fillColor: kSpecialTextFieldBG,
              //     filled: true,
              //   ),
              // ),
              // : Container(),
              // isNoClicked
              //     ?
              // SizedBox(
              //   height: 16.0,
              // ),
              // customButton(
              //   onTap: () {
              //     isNoClicked = true;
              //   },
              //   title: 'send'.tr(),
              //   TextColor: kWhiteColor,
              //   bottomColor: kDeepBlueColor,
              // )
              // : Container(),
            ],
          ),
        ),
      );
    },
  );
}
