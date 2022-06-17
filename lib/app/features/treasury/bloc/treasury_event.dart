part of 'treasury_bloc.dart';

abstract class TreasuryEvent extends Equatable {
  const TreasuryEvent();

  @override
  List<Object> get props => [];
}

class GetTreasuryEvent extends TreasuryEvent {}

class PostTreasuryEvent extends TreasuryEvent {

  final BuildContext context;

  final String symbol;
  final double amount;
  final double buying_price;
  final String transaction_type;

  PostTreasuryEvent(this.context, {
    required this.symbol,
    required this.amount,
    required this.buying_price,
    required this.transaction_type,

  });


}



