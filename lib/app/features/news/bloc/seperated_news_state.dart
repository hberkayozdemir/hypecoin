part of 'seperated_news_bloc.dart';

abstract class SeperatedNewsState extends Equatable {

  @override
  List<Object> get props => [];
}

class SeperatedNewsInitial extends SeperatedNewsState {}
class SeperatedNewsLoading extends SeperatedNewsState {}

class SeperatedNewsLoaded extends SeperatedNewsState{
  final List<News> data;

  SeperatedNewsLoaded(this.data);
}


class SeperatedNewsError extends SeperatedNewsState {
  final String error;
  SeperatedNewsError(this.error);
}

