// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/screens/categories/data/models/category_item_model.dart';
import 'package:shamia/screens/categories/data/models/category_model.dart';
import 'package:shamia/screens/categories/data/repository/category_items_repository.dart';
import 'package:shamia/screens/categories/data/repository/category_repository.dart';
import 'package:shamia/screens/categories/ux/states.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenStates> {
  CategoryScreenCubit() : super(CategoryScreenInitialState());

  static CategoryScreenCubit get(context) => BlocProvider.of(context);
  bool isLaoding = false;
  bool isLaodingItemCategory = false;
  bool isLoadingPagination = false;
  int? categoryId;
  String categoryName = '';
  int? branchId;
  final CategoriesRepository _categoriesRepository = CategoriesRepository();
  final CategoryItemsRepository _categoryItemsRepository =
      CategoryItemsRepository();
  List<Category>? category;
  CategoryItemModel? categoryItem;
  List<CategoryItem> categoryItems = [];
  int currentPage = 1;
  final TrackingScrollController scrollController = TrackingScrollController();

  Future<void> getCategories({int branchId = 32}) async {
    isLaoding = true;
    emit(CategoryLoadingState());
    await _categoriesRepository.getCategories(branchId: branchId).then((value) {
      category = value.data;
      category?.first.isSelected = true;
      print('category list=>  $category');
      emit(CategoryLoadingState());
      isLaoding = false;
      categoryName =
          category?.first.title?.ar != null ? category!.first.title!.ar! : '';
      getCategoryItems(branchId: branchId, categoryId: category?.first.id);
    }).catchError((onError) {
      emit(CategoryLoadingState());
      isLaoding = false;
      print('categories error=>  $onError');
    });
  }

  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.mostRecentlyUpdatedPosition!.maxScrollExtent >
              scrollController.offset &&
          scrollController.mostRecentlyUpdatedPosition!.maxScrollExtent -
                  scrollController.offset <=
              50) {
        if (!isLaodingItemCategory) {
          getCategoryItems(isPagination: true, categoryId: categoryId);
        }
      }
    }
    return true;
  }

  Future<void> getCategoryItems(
      {int? branchId = 25,
      required int? categoryId,
      bool isPagination = false}) async {
    isLaodingItemCategory = true;
    emit(CategoryItemsLoadingState());
    if (isPagination) {
      isLoadingPagination = true;
    }
    if (isPagination) {
      if (categoryItem?.data?.nextPageUrl == null) {
        isLaodingItemCategory = false;
        isLoadingPagination = false;
        return;
      } else {
        currentPage++;
      }
    } else {
      currentPage = 1;
      categoryItems.clear();
      // categoryId = category?.first.id;
    }
    print('categoryId=>>>  $categoryId');
    await _categoryItemsRepository
        .getCategoryItems(
            branchId: branchId,
            categoryId: categoryId,
            paginate: 10,
            pageNumber: currentPage)
        .then((value) {
      categoryItem = value;
      categoryItems.addAll(value.data!.data!);
      print('categoryItem list=>  $categoryItem');
      print('categoryItem list=>  $categoryItems');
      emit(CategoryItemsLoadingState());
      isLaodingItemCategory = false;
    }).catchError((onError) {
      emit(CategoryItemsLoadingState());
      isLaodingItemCategory = false;
      print('categoryItem error=>  $onError');
    });
  }
}
