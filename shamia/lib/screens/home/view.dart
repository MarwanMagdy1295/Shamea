// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/screens/home/cubit.dart';
import 'package:shamia/screens/home/states.dart';
import '../../core/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return const Scaffold(
          backgroundColor: kSpecialHomeBackGround,
          body: Center(
            child: Text('Map Screen'),
          ),
        );
      },
    );
  }
}
