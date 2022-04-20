import 'package:http/http.dart' as http;
import 'package:nkap/data/models/tezos_model.dart';

class TezosBlockRepository {
  final String _baseUrl = "https://api.tzkt.io/v1/blocks";

  Future<TezosBlockModel> getTezosBlock() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return tezosBlockModelFromJson(response.body);
    } else {
      throw Exception("Failed to load tezos block");
    }
  }
}
