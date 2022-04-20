import 'dart:convert';

Transactions transactionsModelFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String transactionsModelToJson(Transactions data) =>
    json.encode(data.toJson());

class Transactions {
  Transactions({
    required this.transactionHash,
    required this.transactionAmount,
    required this.transactionSender,
    required this.transactionTimestamp,
  });

  String transactionHash;
  double transactionAmount;
  Map<String, String> transactionSender;
  DateTime transactionTimestamp;

  factory Transactions.fromJson(Map<String, dynamic> data) =>
      Transactions(
        transactionHash: data['hash'],
        transactionAmount: data['amount'],
        transactionSender: data['sender'],
        transactionTimestamp: data['timestamp'],
      );

  Map<String, dynamic> toJson() => {
        'hash': transactionHash,
        'amount': transactionAmount,
        'sender': transactionSender,
        'timestamp': transactionTimestamp,
      };
}
