import 'dart:convert';

LatestBlockModel latestBlockModelFromJson(String str) =>
    LatestBlockModel.fromJson(json.decode(str));

String latestBlockModelToJson(LatestBlockModel data) => json.encode(data.toJson());

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

  factory LatestBlockModel.fromJson(Map<String, dynamic> json) => LatestBlockModel(
    hash: json["hash"],
    time: json["time"],
    blockIndex: json["blockIndex"],
    height: json["height"],
    txIndexes: json["txIndexes"].cast<int>(),
  );

  Map<String, dynamic> toJson() => {
    "hash": hash,
    "time": time,
    "blockIndex": blockIndex,
    "height": height,
    "txIndexes": txIndexes,
  };
}
