part of 'treasury_bloc.dart';

abstract class TreasuryState extends Equatable {
  const TreasuryState();

  @override
  List<Object> get props => [];
}

class TreasuryInitial extends TreasuryState {}

class TreasuryLoading extends TreasuryState {}

class TreasuryLoaded extends TreasuryState {
  final List<TreasuryModel>  data;


  TreasuryLoaded(this.data);
}

class TreasuryError extends TreasuryState {
  final String error;
  TreasuryError(this.error);
}
