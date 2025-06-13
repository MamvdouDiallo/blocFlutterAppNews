import 'package:bloc_udemy/core/category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState(){
    controller =TabController(length: CategoryList.categoryItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            color:  Colors.purple,
            child: TabBar(
              controller: controller,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              unselectedLabelStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.black.withOpacity(.5)
              ),
              labelStyle: const TextStyle(
                fontSize: 14.0,
                color: Colors.purple
              ),
              labelColor: Colors.white,
              onTap: (index){

              },
              tabs: CategoryList.categoryItems.map((category) => Tab(
                text: category,
              )).toList(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 3),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: controller,
                children: CategoryList.categoryItems.map((category) => Text(category)).toList()),
          )
        ],
      )
    );
  }
}