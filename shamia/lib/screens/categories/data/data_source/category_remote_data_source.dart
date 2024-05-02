import 'package:shamia/helpers/dio_helper.dart';

abstract class CategroiesRemoteDataSourceInterface {
  Future getCategories({
    required int branchId,
  });
}

class CategoriesRemoteDataSource extends CategroiesRemoteDataSourceInterface {
  @override
  Future getCategories({
    required int branchId,
  }) async {
    try {
      final res = await DioHelper.getData(
        path: 'branch/$branchId/categories',
      );
      return res!.data;
    } catch (e) {
      rethrow;
    }
  }
}
