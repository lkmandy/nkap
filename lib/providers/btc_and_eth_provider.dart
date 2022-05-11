import 'package:flutter/material.dart';

import '../data/models/btc_and_eth_latest_block_model.dart';
import '../data/repositories/btc_and_eth_latest_block_repository.dart';

enum Status {
  latestBlockInitial,
  latestBlockLoadingState,
  latestBlockLoadedState,
  latestBlockErrorState,
}

class LatestBlockProvider extends ChangeNotifier {
  final _latestBlockRepository = LatestBlockRepository();
  LatestBlockModel latestBlockData = LatestBlockModel(txIndexes: [], hash: '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103', height: 0 ,blockIndex: 0, time: 0 );

  Status currentStatus = Status.latestBlockInitial;
  Status get status => currentStatus;

  Future<LatestBlockModel> provideLatestBlock() async {
    currentStatus = Status.latestBlockLoadingState;
    try {
      latestBlockData = await _latestBlockRepository.getLatestBlock();
      currentStatus = Status.latestBlockLoadedState;
      notifyListeners();
    } catch (e) {
      currentStatus = Status.latestBlockErrorState;
      notifyListeners();
    }
    return latestBlockData;
  }
}
