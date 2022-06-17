part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();
  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}
class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {
  final AdminStatsModel data;
  AdminLoaded(this.data);
}

class AdminError extends AdminState {
  final String error;
  AdminError(this.error);
}