// ignore_for_file: avoid_print

import 'package:shamia/screens/home/data_source/branches_remote_data_source.dart';
import 'package:shamia/screens/home/models/branches_model.dart';

abstract class BranchesRepositoryInterface {
  Future getBranches();
}

class BranchesRepository extends BranchesRepositoryInterface {
  final BranchesRemoteDataSourceInterface _branchesRemoteDataSource =
      BranchesRemoteDataSource();
  BranchesRepository() : super();

  @override
  Future<BranchesModel> getBranches() async {
    try {
      final data = await _branchesRemoteDataSource.getBranches();
      BranchesModel branches = BranchesModel.fromJson(data);
      return branches;
    } catch (e) {
      rethrow;
    }
  }
}
