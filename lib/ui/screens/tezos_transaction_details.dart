import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/tezos_bloc/tezos_bloc.dart';
import '../../data/repositories/tezos_repository.dart';

class TezosTransactionDetails extends StatefulWidget {
  const TezosTransactionDetails({Key? key}) : super(key: key);

  @override
  State<TezosTransactionDetails> createState() =>
      _TezosTransactionDetailsState();
}

class _TezosTransactionDetailsState extends State<TezosTransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TezosBloc(RepositoryProvider.of<TezosBlockRepository>(context))
            ..add(LoadTezosBlockEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('XTZ Transactions'),
        ),
        body: BlocBuilder<TezosBloc, TezosBlockState>(
          builder: (context, state) {
            if (state is TezosBlockLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TezosBlockLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    itemCount: state.tezosBlock.transactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Text(state.tezosBlock.hash),
                          subtitle: Text("Dracaena"),
                          isThreeLine: true,
                          trailing: Text("4 XTZ"),
                        ),
                        onTap: () {
                        },
                      );
                    }),
              );
            }
            if (state is TezosBlockErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
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
