// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tezos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TezosBlockModel _$TezosBlockModelFromJson(Map<String, dynamic> json) =>
    TezosBlockModel(
      hash: json['hash'] as String,
      transactions: (json['transactions'] as List<dynamic>)
          .map(
              (e) => TezosTransactionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TezosBlockModelToJson(TezosBlockModel instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'transactions': instance.transactions,
    };
