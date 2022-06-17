part of 'seperated_news_bloc.dart';

abstract class SeperatedNewsEvent extends Equatable {
  const SeperatedNewsEvent();

  @override
  List<Object> get props => [];
}

class GetNewsEvent extends SeperatedNewsEvent{}
class FilteredNewsEvent extends SeperatedNewsEvent{}


