part of 'spots_bloc.dart';

abstract class SpotsEvent extends Equatable {
  const SpotsEvent();
  @override
  List<Object> get props => [];
}


class GetSpotsEvent extends SpotsEvent{}
class GetTrendsEvent extends SpotsEvent{}
class GetFavlistEvent extends SpotsEvent{}
class PostSpotsEvent extends SpotsEvent{
  final BuildContext context;
  final String symbol;
  final String current_price;



  PostSpotsEvent(
      this.context, {
        required this.symbol,
        required this.current_price,


      });


}
