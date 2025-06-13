import 'package:bloc_udemy/core/app_strings.dart';
import 'package:bloc_udemy/core/cache_data.dart';
import 'package:bloc_udemy/screens/home_layout_cubit/home_layout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutCubit  extends Cubit<HomeLayoutStates>{
  HomeLayoutCubit():super(HomeLayoutInitStates());
  //the firest time the app will launch it will be light
  /*
  is Dark the default value is false
  cause  the cashed variable = null
   */
  bool isDark=SharedData.getData(key: AppStrings.appTheme) ?? false;
// we will toggle our theme mode from ight to dart
  //to toggle between two values of boolea, we will use exclamation mark "!"
void changeThemeMode(){
  isDark=!isDark;
  SharedData.saveData(key: AppStrings.appTheme, value: isDark);
  emit(ChageThemeModeState());
}
}