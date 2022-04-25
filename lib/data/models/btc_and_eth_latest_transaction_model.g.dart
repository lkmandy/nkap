// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_and_eth_latest_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestTransactionsModel _$LatestTransactionsModelFromJson(
        Map<String, dynamic> json) =>
    LatestTransactionsModel(
      hash: json['hash'] as String,
      transactions: json['transactions'] as List<dynamic>,
      numberOfTransactions: json['numberOfTransactions'] as int,
      time: json['time'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$LatestTransactionsModelToJson(
        LatestTransactionsModel instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'transactions': instance.transactions,
      'numberOfTransactions': instance.numberOfTransactions,
      'time': instance.time,
      'height': instance.height,
    };
