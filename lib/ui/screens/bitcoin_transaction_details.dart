import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nkap/data/repositories/btc_and_eth_latest_block_repository.dart';

import '../../blocs/btc_and_eth_bloc/latest_bloc.dart';

class BitCoinTransactionDetails extends StatefulWidget {
  const BitCoinTransactionDetails({Key? key}) : super(key: key);

  @override
  State<BitCoinTransactionDetails> createState() =>
      _BitCoinTransactionDetailsState();
}

class _BitCoinTransactionDetailsState extends State<BitCoinTransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestBlockBloc(
        RepositoryProvider.of<LatestBlockRepository>(context),
      )..add(LoadLatestBlockEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BTC Transactions'),
        ),
        body: BlocBuilder<LatestBlockBloc, LatestBlockState>(
          builder: (context, state) {
            if (state is LatestBlockLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LatestBlockLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: state.latestBlock.txIndexes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(state.latestBlock.txIndexes[index].toString()),
                            subtitle: Text(state.latestBlock.height.toString()),
                            isThreeLine: true,
                            trailing: Text("4 BTC"),
                          ),
                          onTap: () {},
                        );
                      }),
                ),
              );
            }
            if (state is LatestBlockErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.error.toString()),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
