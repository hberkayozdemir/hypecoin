import 'package:flutter_managers/flutter_managers.dart';

class SpotsModel extends ManagerModel<SpotsModel> {
  String? symbol;
  String? price;

  SpotsModel({this.symbol, this.price});

  factory SpotsModel.fromJson(Map<String, dynamic> json) => SpotsModel(
        price: json["price"] == null ? null : json["price"],
        symbol: json["symbol"] == null ? null : json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price,
        "symbol": symbol == null ? null : symbol,
      };

  @override
  SpotsModel fromJson(Map<String, dynamic> json) => SpotsModel.fromJson(json);
}
class FavlistModel extends ManagerModel<FavlistModel> {
  String? id;
  String? symbol;
  String? currentPrice;
  String? userId;

  FavlistModel({this.id, this.symbol, this.currentPrice, this.userId});

  factory FavlistModel.fromJson(Map<String, dynamic> json) =>FavlistModel(
      id : json['id'] == null ? null:json['id'],
      symbol : json['symbol']==null?null:json['symbol'],
      currentPrice: json['currentPrice']==null?null:json['currentPrice'],
      userId : json['user_id']==null?null:json['user_id']


  );



  Map<String, dynamic> toJson() =>{

  "id":id==null?null:id,
  "symbol":symbol==null?null:symbol,
  "current_price":currentPrice==null?null:currentPrice,
  "user_id":userId==null?null:userId,

  };

  @override
  FavlistModel fromJson(Map<String, dynamic> json) =>FavlistModel.fromJson(json);
}
