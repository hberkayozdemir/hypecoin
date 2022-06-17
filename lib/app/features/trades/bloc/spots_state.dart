part of 'spots_bloc.dart';

abstract class SpotsState extends Equatable {
  const SpotsState();

  @override
  List<Object> get props => [];
}

class SpotsInitial extends SpotsState {}

class SpotsLoading extends SpotsState {}

class SpotsLoaded extends SpotsState {
  final List<SpotsModel> data;

  SpotsLoaded(this.data);
}


class FavListLoading extends SpotsState {}

class FavListLoaded extends SpotsState {
  final List<FavlistModel> data;

  FavListLoaded(this.data);
}

class SpotsError extends SpotsState {
  final String error;
  SpotsError(this.error);
}
