

import 'package:bloc_udemy/core/app_strings.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return Card(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  image:  const DecorationImage(
                      image:  NetworkImage(AppStrings.defaultImage),
                      fit: BoxFit.cover
                  )
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7)
                ),
                child: Text("Title ${index}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white
                ),),
              ),
            ),
          );

        });;
  }
}
