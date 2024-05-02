// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/helpers/navigator_key.dart';
import 'package:shamia/screens/auth/data/models/requests/auth_login_request_model.dart';
import 'package:shamia/screens/auth/data/repository/auth_repository.dart';
import 'package:shamia/screens/auth/sign_in/model/model.dart';
import 'package:shamia/screens/auth/sign_in/ux/states.dart';
import 'package:shamia/screens/home/ui/main_screen.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());
  // AuthRepository? _authRepository;
  // SignInCubit({
  //   AuthRepository? authRepository,
  // })  : _authRepository = authRepository,
  //       super(SignInInitialState());
  final AuthRepository _authRepository = AuthRepository();
  static SignInCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLaoding = false;
  bool isHide = true;
  final formKey = GlobalKey<FormState>();
  UserData? user = UserData();

  hidePassword() {
    emit(SignInHidePasswordState());
    isHide = !isHide;
    print(isHide);
    emit(SignInHidePasswordState());
  }

  Future<void> postLoginData() async {
    if (formKey.currentState!.validate()) {
      isLaoding = true;
      emit(SignInLoadingState());
      await _authRepository
          .login(
              body: AuthLoginRequestModel(
        phoneNumber: emailController.text,
        password: passwordController.text,
      ))
          .then((value) {
        emit(SignInLoadingState());
        isLaoding = false;
        RouteManager.navigateAndPopAll(
          const MapScreen(),
        );
      }).catchError((onError) {
        emit(SignInLoadingState());
        isLaoding = false;
        print('login error=>  $onError');
      });
    }
  }
}
