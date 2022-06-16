part of 'treasury_bloc.dart';

abstract class TreasuryEvent extends Equatable {
  const TreasuryEvent();

  @override
  List<Object> get props => [];
}

class GetTreasuryEvent extends TreasuryEvent {}
