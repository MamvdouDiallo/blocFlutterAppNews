part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class HomeSuccessState extends NewsState{}

class HomeLoadingState extends NewsState{}
class HomeErrorState extends NewsState{
  final String error;
  HomeErrorState({required this.error});
}
