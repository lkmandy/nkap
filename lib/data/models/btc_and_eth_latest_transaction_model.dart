import 'dart:convert';

LatestTransactionsModel latestTransactionsModelFromJson(String str) =>
    LatestTransactionsModel.fromJson(json.decode(str));

String latestTransactionsModelToJson(LatestTransactionsModel data) => json.encode(data.toJson());

class LatestTransactionsModel {
  LatestTransactionsModel({
    required this.hash,
    required this.blockIndex,
    required this.blockHeight,
    required this.txIndex,
    required this.inputs,
    required this.out,
  });

  String? hash;
  int? blockIndex;
  int? blockHeight;
  int? txIndex;
  List<dynamic> inputs;
  List<dynamic> out;


  factory LatestTransactionsModel.fromJson(Map<String, dynamic> json) => LatestTransactionsModel(
    hash: json["hash"],
    blockIndex: json["blockIndex"],
    txIndex: json["txIndexes"],
    blockHeight: json["block_height"],
    inputs: json["inputs"],
    out: json["out"],
  );

  Map<String, dynamic> toJson() => {
    "hash": hash,
    "blockIndex": blockIndex,
    "txIndex": txIndex,
    "block_height": blockHeight,
    "inputs": inputs,
    "out": out,
  };
}
