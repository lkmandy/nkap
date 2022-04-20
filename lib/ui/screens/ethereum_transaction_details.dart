import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/btc_and_eth_bloc/latest_bloc.dart';
import '../../data/repositories/btc_and_eth_latest_block_repository.dart';

class EthereumTransactionDetails extends StatefulWidget {
  const EthereumTransactionDetails({Key? key}) : super(key: key);

  @override
  State<EthereumTransactionDetails> createState() =>
      _EthereumTransactionDetailsState();
}

class _EthereumTransactionDetailsState
    extends State<EthereumTransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestBlockBloc(
        RepositoryProvider.of<LatestBlockRepository>(context),
      )..add(LoadLatestBlockEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ETH Transactions'),
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
                        trailing: Text("4 ETH"),
                      ),
                      onTap: () {},
                    );
                  }),
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
        }),
      ),
    );
  }
}
