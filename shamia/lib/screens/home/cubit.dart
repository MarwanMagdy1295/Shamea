import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamia/screens/home/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavBarIndex = 2;
  int? localAppVersion;
  int? remoteAppVersion;

  void bottomNavBarChangeIndex(index) {
    bottomNavBarIndex = index;
    emit(HomeBottomNavBarChangeTab());
  }
}
