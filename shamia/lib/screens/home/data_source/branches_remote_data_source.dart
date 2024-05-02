import 'package:shamia/helpers/dio_helper.dart';

abstract class BranchesRemoteDataSourceInterface {
  Future getBranches();
}

class BranchesRemoteDataSource extends BranchesRemoteDataSourceInterface {
  @override
  Future getBranches() async {
    try {
      final res = await DioHelper.getData(
        path: 'branches?lat=20.256565&long=30.556654654&company_id=3',
      );
      return res!.data;
    } catch (e) {
      rethrow;
    }
  }
}
