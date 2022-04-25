import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tezos_transactons_model.g.dart';

TezosTransactionsModel tezosTransactionsModelFromJson(String str) => TezosTransactionsModel.fromJson(json.decode(str));
String tezosTezosTransactionsModelToJson(TezosTransactionsModel data) => json.encode(data.toJson());

@JsonSerializable()
class TezosTransactionsModel {
  TezosTransactionsModel({
    required this.transactionHash,
    required this.transactionAmount,
    required this.transactionSender,
    required this.transactionTimestamp,
  });

  String transactionHash;
  double transactionAmount;
  Map<String, String> transactionSender;
  DateTime transactionTimestamp;

  factory TezosTransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TezosTransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TezosTransactionsModelToJson(this);
}