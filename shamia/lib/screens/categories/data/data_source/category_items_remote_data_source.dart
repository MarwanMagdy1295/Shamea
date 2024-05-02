import 'package:shamia/helpers/dio_helper.dart';

abstract class CategoryItemsRemoteDataSourceInterface {
  Future getCategoryItems({
    int? branchId,
    int? categoryId,
    int? paginate,
    required int pageNumber,
  });
}

class CategoryItemsRemoteDataSource
    extends CategoryItemsRemoteDataSourceInterface {
  @override
  Future getCategoryItems({
    int? branchId,
    int? categoryId,
    int? paginate,
    required int pageNumber,
  }) async {
    try {
      final res = await DioHelper.getData(
        path:
            'branch/$branchId/category/$categoryId/products?paginate=$paginate&page=$pageNumber',
      );
      return res!.data;
    } catch (e) {
      rethrow;
    }
  }
}
