import 'package:http/http.dart' as http;
import 'package:nkap/data/models/btc_and_eth_latest_transaction_model.dart';

class LatestTransactionsRepository {
  static String txIndex = "";
  final String _baseUrl = "https://blockchain.info/rawtx/$txIndex";

  Future<LatestTransactionsModel> getLatestTransaction() async {
    final response = await http.get(Uri.parse(_baseUrl), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET",
    });
    if (response.statusCode == 200) {
      return latestTransactionsModelFromJson(response.body);
    } else {
      throw Exception("Failed to load latest transaction");
    }
  }
}
