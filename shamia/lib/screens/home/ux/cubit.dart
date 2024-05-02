// ignore: depend_on_referenced_packages
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:shamia/helpers/navigator_key.dart';
import 'package:shamia/screens/home/models/branches_model.dart';
import 'package:shamia/screens/home/repository/branches_repository.dart';
import 'package:shamia/screens/home/ux/states.dart';
import 'package:shamia/screens/home/widgets/show_error_dialog.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

class MapScreenCubit extends Cubit<MapScreenStates> {
  MapScreenCubit() : super(MapScreenInitialState());

  static MapScreenCubit get(context) => BlocProvider.of(context);
  var selectedPageNumber = 3;
  final BranchesRepository _branchesRepository = BranchesRepository();
  bool isLoading = false;
  List<Branches> branches = [];
  List<Marker> markers = [];

  bool? _permissionReady;
  Future<bool> checkPermission() async {
    final status = await handler.Permission.locationWhenInUse.status;
    if (status == handler.PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future getLocationPermition(BuildContext context) async {
    _permissionReady = await checkPermission();
    if (_permissionReady!) {
      // var position = await Geolocator.getCurrentPosition();
      // appData.location = Geometry(
      //   location: Location(lat: position.latitude, lng: position.longitude),
      // );
    } else {
      handler.PermissionStatus status =
          await handler.Permission.location.status;
      if (status == handler.PermissionStatus.permanentlyDenied) {
        ShowErrorDialog().run(context, 'يرجى منح إذن الوصول إلى الموقع',
            onYes: () async {
          RouteManager.pop();
          await handler.openAppSettings();
        }, onNo: () {
          RouteManager.pop();
        });
      } else {
        await handler.Permission.location.request();
      }
      if (await handler.Permission.location.request().isGranted) {
        // var position = await Geolocator.getCurrentPosition();
        // appData.location = Geometry(
        //   location: Location(lat: position.latitude, lng: position.longitude),
        // );
      }
    }
  }

  Future<void> getBranches() async {
    isLoading = true;
    emit(MapScreenLoadingState());
    await _branchesRepository.getBranches().then((value) {
      branches.addAll(value.data!);
      for (var element in branches) {
        markers.add(
          Marker(
            markerId: MarkerId('${element.id}'),
            position:
                LatLng(double.parse(element.lat!), double.parse(element.long!)),
          ),
        );
      }
      if (kDebugMode) {
        print('branches list=>  $branches');
      }
      emit(MapScreenLoadingState());
      isLoading = false;
    }).catchError((onError) {
      emit(MapScreenLoadingState());
      isLoading = false;
      if (kDebugMode) {
        print('categoryItem error=>  $onError');
      }
    });
  }
}
