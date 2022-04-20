import 'dart:convert';

import 'package:nkap/data/models/tezos_transactons_model.dart';

TezosBlockModel tezosBlockModelFromJson(String str) =>
    TezosBlockModel.fromJson(json.decode(str));

String tezosBlockModelToJson(TezosBlockModel data) => json.encode(data.toJson());

class TezosBlockModel {
  TezosBlockModel({
    required this.hash,
    required this.transactions,
  });

  String hash;
  List<Transactions> transactions;

  factory TezosBlockModel.fromJson(Map<String, dynamic> json) {
       final  hash = json["hash"];
       var transactionData = json['transactions'] as List;
       List<Transactions> transactions = transactionData.map((i) => Transactions.fromJson(i)).toList();
        return TezosBlockModel(hash: hash, transactions: transactions);
}
  Map<dynamic, dynamic> toJson() =>
      {
        "hash": hash,
        "transactions": transactions
      };


}