// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../core/color.dart';
import '../../../helpers/navigator_key.dart';

PreferredSizeWidget DefaultAppBAr({back, tittle}) => AppBar(
      automaticallyImplyLeading: back,
      centerTitle: true,
      backgroundColor: kSpecialHomeIcons,
      title: Text(tittle),
      leading: back
          ? IconButton(
              onPressed: () {
                RouteManager.pop();
              },
              icon: const Icon(Icons.arrow_back))
          : null,
    );
