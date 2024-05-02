import 'package:shamia/helpers/dio_helper.dart';
import 'package:shamia/screens/auth/data/models/requests/auth_login_request_model.dart';

abstract class AuthRemoteDataSourceInterface {
  Future login({
    required AuthLoginRequestModel body,
  });
}

class AuthRemoteDataSource extends AuthRemoteDataSourceInterface {
  @override
  Future login({
    required AuthLoginRequestModel body,
  }) async {
    try {
      final res = await DioHelper.postData(
        path: 'auth/login',
        data: body.toJson(),
      );
      return res!.data;
    } catch (e) {
      rethrow;
    }
  }
}
