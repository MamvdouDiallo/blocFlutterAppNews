import 'package:bloc_udemy/core/app_router.dart';
import 'package:bloc_udemy/core/app_strings.dart';
import 'package:bloc_udemy/core/cache_data.dart';
import 'package:bloc_udemy/screens/home_layout/home_layout.dart';
import 'package:bloc_udemy/screens/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:bloc_udemy/screens/home_layout/home_layout_cubit/home_layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer.dart';

void main()  async{
WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await SharedData.int();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(
 builder: (context,state){
   return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'News App',
       theme: ThemeData.light(),
       darkTheme: ThemeData.dark(),
       themeMode:   context.watch<HomeLayoutCubit>().isDark ? ThemeMode.dark : ThemeMode.light,
       onGenerateRoute: AppRouter().onGenerateRoute,
     initialRoute: AppStrings.layout,
   );
 },
      )
    );
  }
}


