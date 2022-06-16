import 'package:flutter_managers/flutter_managers.dart';

class TreasuryModel extends ManagerModel<TreasuryModel> {
  TreasuryModel({
    this.id,
    this.userId,
    this.symbol,
    this.amount,
    this.buyingPrice,
    this.createdAt,
    this.transactionType,
  });

  String? id;
  String? userId;
  String? symbol;
  int? amount;
  int? buyingPrice;
  DateTime? createdAt;
  String? transactionType;

  factory TreasuryModel.fromJson(Map<String, dynamic> json) => TreasuryModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        amount: json["amount"] == null ? null : json["amount"],
        buyingPrice: json["buying_price"] == null ? null : json["buying_price"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        transactionType: json["transaction_type"] == null ? null : json["transaction_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "symbol": symbol == null ? null : symbol,
        "amount": amount == null ? null : amount,
        "buying_price": buyingPrice == null ? null : buyingPrice,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "transaction_type": transactionType == null ? null : transactionType,
      };

  @override
  TreasuryModel fromJson(Map<String, dynamic> json) => TreasuryModel.fromJson(json);
}
