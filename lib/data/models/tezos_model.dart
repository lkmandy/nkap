import 'package:json_annotation/json_annotation.dart';
import 'package:nkap/data/models/tezos_transactons_model.dart';

part 'tezos_model.g.dart';

@JsonSerializable()
class TezosBlockModel {
  TezosBlockModel({
    required this.hash,
    required this.transactions,
  });

  String hash;
  List<TezosTransactionsModel> transactions;

  factory TezosBlockModel.fromJson(Map<String, dynamic> json) =>
      _$TezosBlockModelFromJson(json);

  Map<String, dynamic> toJson() => _$TezosBlockModelToJson(this);
}