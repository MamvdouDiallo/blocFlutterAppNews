import 'package:bloc_udemy/core/cache_data.dart';
import 'package:bloc_udemy/screens/home_layout.dart';
import 'package:bloc_udemy/screens/home_layout_cubit/home_layout_cubit.dart';
import 'package:bloc_udemy/screens/home_layout_cubit/home_layout_states.dart';
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
       home: const HomeLayout()
   );
 },
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,

      body: Center(
        child: Text("Home screen ",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white),)

      ),
    );
  }
}
