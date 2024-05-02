import 'package:flutter/foundation.dart';
import 'package:shamia/helpers/cash_helper.dart';
import 'package:shamia/screens/auth/data/data_source/auth_remote_data_source.dart';
import 'package:shamia/screens/auth/data/models/requests/auth_login_request_model.dart';

abstract class AuthRepositoryInterface {
  Future login({
    required AuthLoginRequestModel body,
  });
}

class AuthRepository extends AuthRepositoryInterface {
  final AuthRemoteDataSourceInterface _authRemoteDataSource =
      AuthRemoteDataSource();
  AuthRepository() : super();
  // AuthRepository({
  //   required AuthRemoteDataSource authRemoteDataSource,
  // }) : _authRemoteDataSource = authRemoteDataSource;
  @override
  Future login({
    required AuthLoginRequestModel body,
    bool? rememberMe,
  }) async {
    try {
      final data = await _authRemoteDataSource.login(body: body);
      final token = await data['data']['access_token'];
      CashedHelper.setUserToken(token);
      if (kDebugMode) {
        print('userToken=>>  ${CashedHelper.getUserToken()}');
      }
      // final rawUser = _jwtService.decode(token!);
      // final user = UserModel.fromJson(rawUser).merge(
      //   user: UserModel(token: token),
      // );
    } catch (e) {
      rethrow;
    }
  }
}
