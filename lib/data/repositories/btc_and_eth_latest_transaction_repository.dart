import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nkap/data/models/btc_and_eth_latest_transaction_model.dart';

class LatestTransactionsRepository {
  static String txHash = "BLq3jarZuxz4F7pamd9xvNmrSstMqAS2JMP5SB2VMqpdWpN88eJ";
  final String _baseUrl = "https://blockchain.info/rawtx/$txHash";
  Future<LatestTransactionsModel> getLatestTransaction() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return latestTransactionsModelFromJson(response.body);
    } else {
      throw Exception("Failed to load latest transaction");
    }
  }
}
