// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_local_variable, avoid_print
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/core/constant.dart';
import 'package:shamia/helpers/navigator_key.dart';
import 'package:shamia/screens/auth/sign_in/ui/loading.dart';
import 'package:shamia/screens/categories/ui/item_card.dart';
import 'package:shamia/screens/categories/ux/cubit.dart';
import 'package:shamia/screens/categories/ux/states.dart';
import 'package:shamia/screens/categories/widgets/default_app_bar.dart';
import 'package:shamia/screens/item_details_screen/ui/item_details_screen.dart';

class CategoryScreen extends StatefulWidget {
  final int branchId;
  const CategoryScreen({Key? key, required this.branchId}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CategoryScreenCubit()..getCategories(branchId: widget.branchId),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<CategoryScreenCubit>();
          return BlocBuilder<CategoryScreenCubit, CategoryScreenStates>(
            builder: (state, index) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: kWhiteColor,
                  appBar: defaultAppBAr(tittle: cubit.categoryName),
                  // cubit.category?.first.title?.ar
                  body: cubit.isLaoding
                      ? CustomLoading()
                      : Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              heght10,
                              SizedBox(
                                height: Platform.isAndroid
                                    ? MediaQuery.sizeOf(context).height * .186
                                    : MediaQuery.sizeOf(context).height * .15,
                                child: ListView.builder(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          cubit.categoryId =
                                              cubit.category?[index].id;
                                          // cubit.category?[index].isSelected =
                                          //     !cubit
                                          //         .category![index].isSelected!;
                                          print(
                                              'cubit.categoryId=> ${cubit.categoryId}');
                                          cubit.category?.forEach((element) {
                                            if (element.id ==
                                                cubit.category?[index].id) {
                                              cubit.category?[index]
                                                  .isSelected = true;
                                              cubit.categoryName = cubit
                                                  .category![index].title!.ar!;
                                            } else {
                                              element.isSelected = false;
                                            }
                                          });
                                          cubit.getCategoryItems(
                                              branchId: widget.branchId,
                                              categoryId: cubit.categoryId);
                                          // cubit.category?.firstWhere((element) {
                                          //   if (element.id ==
                                          //       cubit.category?[index].id) {
                                          //     cubit.category?[index]
                                          //             .isSelected =
                                          //         !cubit.category![index]
                                          //             .isSelected!;
                                          //   } else {
                                          //     element.isSelected = !cubit
                                          //         .category![index].isSelected!;
                                          //   }
                                          // });
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 75.0,
                                            width: 75.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: cubit.category?[index]
                                                          .isSelected ==
                                                      true
                                                  ? kbackGroundColor
                                                  : Colors.white,
                                              image: DecorationImage(
                                                image: NetworkImage(cubit
                                                            .category?[index]
                                                            .image !=
                                                        null
                                                    ? cubit
                                                        .category![index].image!
                                                    : 'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                                                fit: BoxFit.fill,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade600
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 15)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  itemCount: cubit.category!.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                ),
                              ),
                              cubit.categoryItems == []
                                  ? SizedBox(
                                      child: Center(
                                        child: Text('لا يوجد منتجات'),
                                      ),
                                    )
                                  : Expanded(
                                      child: NotificationListener(
                                        onNotification: cubit.onNotification,
                                        child: StatefulBuilder(
                                            builder: (context, state) {
                                          return Column(
                                            children: [
                                              cubit.isLaodingItemCategory
                                                  ? CustomLoading()
                                                  : Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: GridView.builder(
                                                          physics:
                                                              BouncingScrollPhysics(),
                                                          controller: cubit
                                                              .scrollController,
                                                          itemCount: cubit
                                                              .categoryItems
                                                              .length,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                  childAspectRatio:
                                                                      .85,
                                                                  // mainAxisExtent:
                                                                  //     220.0,
                                                                  crossAxisCount:
                                                                      2),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 80.0),
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return itemCard(
                                                              context: context,
                                                              id: cubit
                                                                  .categoryItems[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                              img: cubit
                                                                      .categoryItems[
                                                                          index]
                                                                      .images
                                                                      ?.first
                                                                      .image ??
                                                                  '',
                                                              title: cubit
                                                                  .categoryItems[
                                                                      index]
                                                                  .title
                                                                  ?.ar,
                                                              subTitle: cubit
                                                                      .categoryItems[
                                                                          index]
                                                                      .description
                                                                      ?.ar ??
                                                                  '',
                                                              price: cubit
                                                                  .categoryItems[
                                                                      index]
                                                                  .price
                                                                  .toString(),
                                                              onTap: () {
                                                                RouteManager
                                                                    .navigateTo(
                                                                  ItemDetailsScreen(
                                                                    categoryItem:
                                                                        cubit.categoryItems[
                                                                            index],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                              if (cubit.isLoadingPagination)
                                                SizedBox(
                                                  height: 50,
                                                  child: CustomLoading(),
                                                )
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
