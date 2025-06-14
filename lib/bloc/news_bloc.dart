import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_udemy/data/news_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  List<NewsModel> news=[];
  NewsBloc() : super(NewsInitialState()) {
    on<NewsEvents>((event, emit) async {
      //loading state
      emit(HomeLoadingState());
      Dio dio =Dio();
      try{
        final response=await dio.get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c934e7593944e6cbe2d155c31ead46d");
        if(response.statusCode==200){
          news=response.data["articles"].map<NewsModel>((e)=>NewsModel.fromJson(e)).toList();
          print("Data is ok");
          emit(HomeSuccessState());
        }
      } on DioException catch (error){
      print("THere is an error");
      emit(HomeErrorState( error: error.toString()));
      }
      // TODO: implement event handler
    });
  }
}
