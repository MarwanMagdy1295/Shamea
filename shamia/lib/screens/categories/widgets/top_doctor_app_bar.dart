import 'package:flutter/material.dart';
import 'package:shamia/core/color.dart';

AppBar topDoctorAppBar(String title, List<Widget> actions, Widget? leading,
    {bool automaticallyImplyLeading = true,
    BuildContext? context,
    bool hasLogo = true,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    backgroundColor: kBlueColor,
    toolbarHeight: 100.0,
    centerTitle: true,
    title: Text(title),
    actions: actions,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          30.0,
        ),
        bottomRight: Radius.circular(
          30.0,
        ),
      ),
    ),
    automaticallyImplyLeading: false,
  );
}
