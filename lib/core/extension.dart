



import 'package:flutter/material.dart';

extension Navigation on BuildContext{
   Future<dynamic> pushNamed({required String routeName}){
     return Navigator.pushNamed(this,routeName);
   }
   Future<dynamic> pushReplacementNamed({required String routeName}){
     return Navigator.pushReplacementNamed(this, routeName);
   }

   void pop()=>Navigator.pop(this);

   Future<dynamic> pushAndRemoveUntil({required String routeName}){
     return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
   }

   Future<dynamic> push(Widget widget){
     return Navigator.push(this, MaterialPageRoute(builder: (_)=>widget));
   }








}