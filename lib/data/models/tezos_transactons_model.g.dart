// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tezos_transactons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TezosTransactionsModel _$TezosTransactionsModelFromJson(
        Map<String, dynamic> json) =>
    TezosTransactionsModel(
      transactionHash: json['transactionHash'] as String,
      transactionAmount: (json['transactionAmount'] as num).toDouble(),
      transactionSender:
          Map<String, String>.from(json['transactionSender'] as Map),
      transactionTimestamp:
          DateTime.parse(json['transactionTimestamp'] as String),
    );

Map<String, dynamic> _$TezosTransactionsModelToJson(
        TezosTransactionsModel instance) =>
    <String, dynamic>{
      'transactionHash': instance.transactionHash,
      'transactionAmount': instance.transactionAmount,
      'transactionSender': instance.transactionSender,
      'transactionTimestamp': instance.transactionTimestamp.toIso8601String(),
    };
