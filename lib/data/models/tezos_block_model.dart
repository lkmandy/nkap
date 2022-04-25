import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:nkap/data/models/btc_eth_transactons_model.dart';

part 'tezos_model.g.dart';

TezosBlockModel tezosBlockModelFromJson(String str) => TezosBlockModel.fromJson(json.decode(str));
String tezosBlockModelToJson(TezosBlockModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TezosBlockModel {
  TezosBlockModel({
    required this.hash,
    required this.level,
    required this.timestamp,
    required this.cycle,
    required this.fee,
    required this.deposit,

  });

  String hash;
  int level;
  DateTime timestamp;
  int cycle;
  int fee;
  int deposit;

  factory TezosBlockModel.fromJson(Map<String, dynamic> json) =>
      _$TezosBlockModelFromJson(json);

  Map<String, dynamic> toJson() => _$TezosBlockModelToJson(this);
}
