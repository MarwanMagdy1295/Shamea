// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_local_variable
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/core/color.dart';
import 'package:shamia/core/constant.dart';
import 'package:shamia/core/toast.dart';
import 'package:shamia/helpers/navigator_key.dart';
import 'package:shamia/screens/auth/sign_in/ui/loading.dart';
import 'package:shamia/screens/categories/ui/category_screen.dart';
import 'package:shamia/screens/home/ux/cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shamia/screens/home/ux/states.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  // var selectedPageNumber = 1;
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(20.256565, 30.556654654),
    zoom: 4.5,
  );
  List<Marker> markers = [
    Marker(markerId: MarkerId('1'), position: LatLng(20.256565, 30.556654654)),
    Marker(markerId: MarkerId('1'), position: LatLng(10.256565, 20.556654654)),
    Marker(markerId: MarkerId('1'), position: LatLng(40.256565, 50.556654654)),
    Marker(markerId: MarkerId('1'), position: LatLng(80.256565, -30.556654654)),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MapScreenCubit()..getBranches(),
      child: Builder(builder: (context) {
        final cubit = context.watch<MapScreenCubit>();
        cubit.getLocationPermition(context);
        return BlocBuilder<MapScreenCubit, MapScreenStates>(
          builder: (state, index) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: kWhiteColor,
                body: cubit.isLoading
                    ? CustomLoading()
                    : Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: _kGooglePlex,
                            markers: Set<Marker>.of(cubit.markers),
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            // onMapCreated: (GoogleMapController controller) {
                            //   _controller.complete(controller);
                            // },
                          ),
                          Positioned(
                            bottom: 60,
                            right: 10,
                            child: Container(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: Platform.isAndroid
                                    ? MediaQuery.sizeOf(context).height * .35
                                    : MediaQuery.sizeOf(context).height * .3,
                                width: MediaQuery.sizeOf(context).width,
                                child: ListView.builder(
                                  itemCount: cubit.branches.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
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
                                        cubit.branches[index].statusAr ==
                                                'الفرع مفتوح'
                                            ? RouteManager.navigateTo(
                                                CategoryScreen(
                                                  branchId:
                                                      cubit.branches[index].id!,
                                                ),
                                              )
                                            : customToast('الفرع مغلق');
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                .4,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .95,
                                        color: kWhiteColor,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        cubit.branches[index]
                                                            .title!.ar!,
                                                        style: TextStyle(
                                                            color: kBlackColor,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      child: Text(
                                                          'رقم الجوال: ${cubit.branches[index].phone}'),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 55.0,
                                                  width: 55.0,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      image: NetworkImage(cubit
                                                                  .branches[
                                                                      index]
                                                                  .image !=
                                                              null
                                                          ? cubit
                                                              .branches[index]
                                                              .image!
                                                          : 'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade600
                                                              .withOpacity(0.2),
                                                          spreadRadius: 1,
                                                          blurRadius: 15)
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Divider(
                                                color: Colors.black
                                                    .withOpacity(.1),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      child:
                                                          Text('عنوان الفرع'),
                                                    ),
                                                    SizedBox(
                                                      child: Text(
                                                        '${cubit.branches[index].address!.ar}',
                                                        style: TextStyle(
                                                          color: kBlackColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Icon(
                                                    Icons.my_location_outlined,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            heght20,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                          'الوصول إلى الفرع'),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'كم ',
                                                          style: TextStyle(
                                                            color: kBlackColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            cubit
                                                                .branches[index]
                                                                .distance!
                                                                .toStringAsFixed(
                                                                    2),
                                                            style: TextStyle(
                                                              color:
                                                                  kBlackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Icon(
                                                    Icons.location_on,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            heght20,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      cubit.branches[index]
                                                                  .morningTimeTo !=
                                                              null
                                                          ? cubit
                                                              .branches[index]
                                                              .morningTimeTo!
                                                          : cubit
                                                                      .branches[
                                                                          index]
                                                                      .eveningTimeTo !=
                                                                  null
                                                              ? cubit
                                                                  .branches[
                                                                      index]
                                                                  .eveningTimeTo!
                                                              : '',
                                                    ),
                                                    SizedBox(
                                                      child: Text(
                                                        ' | يغلق',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                        color:
                                                            kbackGroundColor),
                                                  ),
                                                  child: Text(
                                                    'مفتوح',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      }),
    );
  }
}
