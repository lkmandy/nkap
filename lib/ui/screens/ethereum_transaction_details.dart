import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/btc_and_eth_provider.dart';
import '../../providers/latest_transactions_provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('ETH Transactions'),
      ),
      body: Consumer<LatestBlockProvider>(
        builder: (context, latestBlock, child) {
          Provider.of<LatestTransactionsProvider>(context)
              .provideLatestTransactions(latestBlock.latestBlockData.hash);
          return Consumer<LatestTransactionsProvider>(
              builder: (context, latestTransactions, child) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                    child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: latestTransactions
                      .latestTransactionsData.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ListTile(
                        tileColor: Colors.white,
                        title: Text('Transaction ${index + 1}:'),
                        subtitle: Text(
                            'time: ${latestTransactions.latestTransactionsData.transactions[index].transactionTimestamp.toString()} \nindex: ${latestTransactions.latestTransactionsData.transactions[index].transactionIndex}'),
                        isThreeLine: true,
                        trailing: Text(
                            '${latestTransactions.latestTransactionsData.transactions[index].transactionAmount.toString()} BTC'),
                      ),
                      onTap: () {},
                    );
                  },
                )));
          });
        },
      ),
    );
  }
}
