// ignore_for_file: avoid_print

import 'package:shamia/screens/categories/data/data_source/category_remote_data_source.dart';
import 'package:shamia/screens/categories/data/models/category_model.dart';

abstract class CategoriesRepositoryInterface {
  Future getCategories({
    required int branchId,
  });
}

class CategoriesRepository extends CategoriesRepositoryInterface {
  final CategroiesRemoteDataSourceInterface _categoriesRemoteDataSource =
      CategoriesRemoteDataSource();
  CategoriesRepository() : super();

  @override
  Future<CategoryModel> getCategories({required int branchId}) async {
    try {
      final data =
          await _categoriesRemoteDataSource.getCategories(branchId: branchId);
      CategoryModel categories = CategoryModel.fromJson(data);
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
