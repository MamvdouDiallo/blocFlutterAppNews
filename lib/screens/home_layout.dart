

import 'package:bloc_udemy/screens/home_layout_cubit/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("News App"),
        centerTitle: true ,
        actions: [
          IconButton(onPressed: (){
            BlocProvider.of<HomeLayoutCubit>(context).changeThemeMode();
          }, icon: Icon( context.watch<HomeLayoutCubit>().isDark ?  Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: const Center(
        child: Text('Home Layout'),
      ),
    );
  }
}
