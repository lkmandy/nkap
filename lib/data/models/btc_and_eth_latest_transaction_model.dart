import 'package:json_annotation/json_annotation.dart';

part 'btc_and_eth_latest_transaction_model.g.dart';

@JsonSerializable()
class LatestTransactionsModel {
  LatestTransactionsModel({
    required this.hash,
    required this.transactions,
    required this.numberOfTransactions,
    required this.time,
    required this.height

  });

  String hash;
  List<dynamic> transactions;
  int numberOfTransactions;
  int time;
  int height;

  factory LatestTransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$LatestTransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatestTransactionsModelToJson(this);

}