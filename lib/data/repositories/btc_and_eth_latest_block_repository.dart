import 'package:nkap/data/models/btc_and_eth_latest_block_model.dart';
import 'package:http/http.dart' as http;

class LatestBlockRepository {
  final String _baseUrl = "https://blockchain.info/latestblock";

  Future<LatestBlockModel> getLatestBlock() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return latestBlockModelFromJson(response.body);
    } else {
      throw Exception("Failed to load latest block");
    }
  }
}
