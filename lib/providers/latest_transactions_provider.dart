import 'package:flutter/material.dart';
import 'package:nkap/data/models/btc_and_eth_latest_transaction_model.dart';

import '../data/repositories/btc_and_eth_latest_transaction_repository.dart';

enum Status {
  latestTransactionsInitial,
  latestTransactionsLoadingState,
  latestTransactionsLoadedState,
  latestTransactionsErrorState,
}

class LatestTransactionsProvider extends ChangeNotifier {
  final _latestTransactionsRepository = LatestTransactionsRepository();
  LatestTransactionsModel latestTransactionsData = LatestTransactionsModel(
      hash: '',
      transactions: [],
      numberOfTransactions: 0,
      time: 0,
      fee: 0,
      size: 0);

  Status currentStatus = Status.latestTransactionsInitial;
  Status get status => currentStatus;

  Future<LatestTransactionsModel> provideLatestTransactions(String hash) async {
    currentStatus = Status.latestTransactionsLoadingState;
    try {
      latestTransactionsData = await _latestTransactionsRepository
          .getLatestTransaction(blockHash: hash);
      currentStatus = Status.latestTransactionsLoadedState;
      notifyListeners();
    } catch (e) {
      currentStatus = Status.latestTransactionsErrorState;
      notifyListeners();
    }
    return latestTransactionsData;
  }
}
