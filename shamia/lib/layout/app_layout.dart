// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/helpers/cash_helper.dart';
import 'package:shamia/helpers/navigator_key.dart';
import 'package:shamia/screens/auth/sign_in/ui/view.dart';
import 'package:shamia/screens/home/cubit.dart';
import 'package:shamia/screens/home/ui/main_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(
          create: (context) => HomeCubit(),
        )
      ],
      child: MaterialApp(
        // navigatorKey: navigatorKey,
        // onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Shamia',
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          fontFamily: 'Cairo',
          sliderTheme: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
            thumbColor: kLightBlueColor,
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(primary),
          ),
          scaffoldBackgroundColor: kbackGroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBlueColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
            centerTitle: true,
            toolbarTextStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            foregroundColor: kWhiteColor,
          ),
        ),
        home:
            CashedHelper.getUserToken().isEmpty ? SignInScreen() : MapScreen(),
      ),
    );
  }
}
