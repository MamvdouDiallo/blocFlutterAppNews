

import 'package:bloc_udemy/bloc/news_bloc.dart';
import 'package:bloc_udemy/core/app_strings.dart';
import 'package:bloc_udemy/core/extension.dart';
import 'package:bloc_udemy/screens/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:bloc_udemy/screens/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../category/category_screen.dart';
class HomeLayout extends StatelessWidget {
   HomeLayout({super.key});
  final pageController =PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("News App"),
        centerTitle: true ,
        actions: [
          IconButton(onPressed: (){
            BlocProvider.of<HomeLayoutCubit>(context).changeThemeMode();
          }, icon: Icon( context.watch<HomeLayoutCubit>().isDark ?  Icons.dark_mode_outlined : Icons.light_mode_outlined)),
          IconButton(onPressed: (){
          //  Navigator.of(context).pushNamed(AppStrings.secondScreen);
            context.pushNamed(routeName: AppStrings.secondScreen);
          }, icon: const Icon(Icons.navigate_next_outlined)),
           IconButton(onPressed: (){
             context.read<NewsBloc>().add(HomeEvent());
           }, icon: const Icon(Icons.add))
        ],
      ),
      body: PageView(
        controller: pageController,
          onPageChanged: (int index){
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
          },
          children: [
            NewsList(),
            CategoryScreen()
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<HomeLayoutCubit>().currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (int index){
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
          pageController.jumpToPage(index);
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label:AppStrings.home,
            tooltip: AppStrings.home,
            activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),
              label:AppStrings.category,
              tooltip: AppStrings.category,
              activeIcon: Icon(Icons.category_outlined)
          )

        ],
      ),
    );
  }
}
