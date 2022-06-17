import 'package:flutter_managers/flutter_managers.dart';

class AdminStatsModel extends ManagerModel<AdminStatsModel> {
  AdminStatsModel({
     this.codesCount,
     this.coinsCount,
     this.favListCount,
     this.newsCount,
     this.spotsCount,
     this.transactionsCount,
  });
    int ? codesCount;
    int ?  coinsCount;
    int ?  favListCount;
    int ?  newsCount;
    int  ? spotsCount;
    int  ? transactionsCount;

  factory AdminStatsModel.fromJson(Map<String, dynamic> json)=>AdminStatsModel(
      codesCount : json['codesCount']==null?null : json['codesCount'],
      coinsCount : json['coinsCount']==null?null : json['coinsCount'],
      favListCount : json['favListCount']==null?null : json['favListCount'],
      newsCount : json['newsCount']==null?null : json['newsCount'],
      spotsCount : json['spotsCount']==null?null : json['spotsCount'],
      transactionsCount : json['transactionsCount']==null?null : json['transactionsCount'],
  );



  Map<String, dynamic> toJson() =>{
  "codesCount": codesCount == null ? null : codesCount,
  "coinsCount": coinsCount == null ? null : coinsCount,
  "favListCount": favListCount == null ? null : favListCount,
  "newsCount": newsCount == null ? null : newsCount,
  "spotsCount": spotsCount == null ? null : spotsCount,
  "transactionsCount": transactionsCount == null ? null : transactionsCount,

  };

  @override
  AdminStatsModel fromJson(Map<String, dynamic> json) => AdminStatsModel.fromJson(json);
}