

import 'package:bloc_udemy/core/app_strings.dart';
import 'package:bloc_udemy/screens/home_layout/home_layout.dart';
import 'package:bloc_udemy/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_)=> HomeLayout());
      case AppStrings.secondScreen:
        return MaterialPageRoute(builder: (_)=> const SecondScreen());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(appBar: AppBar(),
        body: Text("${AppStrings.noRoutes} ${settings.name}"),));
    }
  }
}