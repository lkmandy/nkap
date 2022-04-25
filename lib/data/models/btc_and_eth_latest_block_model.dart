import 'package:json_annotation/json_annotation.dart';

part 'btc_and_eth_latest_block_model.g.dart';

@JsonSerializable()
class LatestBlockModel {
  LatestBlockModel({
    required this.hash,
    required this.time,
    required this.blockIndex,
    required this.height,
    required this.txIndexes,

  });

  String? hash;
  int? time;
  int? blockIndex;
  int? height;
  List<int> txIndexes;

  factory LatestBlockModel.fromJson(Map<String, dynamic> json) =>
      _$LatestBlockModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatestBlockModelToJson(this);
}
