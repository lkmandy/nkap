import 'package:flutter/material.dart';
import 'package:nkap/data/models/tezos_block_model.dart';
import '../data/repositories/tezos_repository.dart';

enum Status {
  tezosInitial,
  tezosLoadingState,
  tezosLoadedState,
  tezosErrorState,
}

class TezosProvider extends ChangeNotifier {
  final _tezosBlockRepository = TezosBlockRepository();
  List<TezosBlockModel> tezosData = <TezosBlockModel>[];

  Status currentStatus = Status.tezosInitial;
  Status get status => currentStatus;

  Future<List<TezosBlockModel>> provideTezos() async {
    currentStatus = Status.tezosLoadingState;
    try {
      tezosData = await _tezosBlockRepository.getTezosBlock();
      currentStatus = Status.tezosLoadedState;
      notifyListeners();
    } catch (e) {
      currentStatus = Status.tezosErrorState;
      notifyListeners();
    }
    return tezosData;
  }
}
