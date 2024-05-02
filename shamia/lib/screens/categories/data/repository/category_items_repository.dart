// ignore_for_file: avoid_print

import 'package:shamia/screens/categories/data/data_source/category_items_remote_data_source.dart';
import 'package:shamia/screens/categories/data/models/category_item_model.dart';

abstract class CategoryItemsRepositoryInterface {
  Future getCategoryItems({
    required int branchId,
    required int categoryId,
    int? paginate,
    required int pageNumber,
  });
}

class CategoryItemsRepository extends CategoryItemsRepositoryInterface {
  final CategoryItemsRemoteDataSourceInterface _categoryItemsRemoteDataSource =
      CategoryItemsRemoteDataSource();
  CategoryItemsRepository() : super();

  @override
  Future<CategoryItemModel> getCategoryItems({
    int? branchId,
    int? categoryId,
    int? paginate,
    required int pageNumber,
  }) async {
    try {
      final data = await _categoryItemsRemoteDataSource.getCategoryItems(
        branchId: branchId,
        categoryId: categoryId,
        paginate: 10,
        pageNumber: pageNumber,
      );
      CategoryItemModel categoryItem = CategoryItemModel.fromJson(data);
      return categoryItem;
    } catch (e) {
      rethrow;
    }
  }
}
