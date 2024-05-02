import 'package:flutter/material.dart';
import 'package:shamia/helpers/cash_helper.dart';
import 'package:shamia/helpers/dio_helper.dart';
import 'package:shamia/layout/app_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();
  await DioHelper.init();
  runApp(const AppLayout());
}
