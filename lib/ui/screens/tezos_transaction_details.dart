import 'package:flutter/material.dart';
import 'package:nkap/providers/tezos_provider.dart';
import 'package:provider/provider.dart';

class TezosTransactionDetails extends StatefulWidget {
  const TezosTransactionDetails({Key? key}) : super(key: key);

  @override
  State<TezosTransactionDetails> createState() =>
      _TezosTransactionDetailsState();
}

class _TezosTransactionDetailsState extends State<TezosTransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('XTZ Transactions'),
        ),
        body: Consumer<TezosProvider>(builder: (context, tezosProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scrollbar(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: tezosProvider.tezosData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ListTile(
                        tileColor: Colors.white,
                        title: Text(
                            'Block ${tezosProvider.tezosData[index].level}'),
                        subtitle: Text(
                            'time: ${tezosProvider.tezosData[index].timestamp}'
                            '\ncycle: ${tezosProvider.tezosData[index].cycle}'),
                        isThreeLine: true,
                        trailing: Text(
                            '${tezosProvider.tezosData[index].deposit} XTZ'),
                      ),
                      onTap: () {},
                    );
                  }),
            ),
          );
        }));
  }
}
