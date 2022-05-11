import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:nkap/colors/colors.dart';
import 'package:nkap/providers/auth_provider.dart';
import 'package:nkap/ui/screens/bitcoin_transaction_details.dart';
import 'package:nkap/ui/screens/ethereum_transaction_details.dart';
import 'package:nkap/ui/screens/tezos_transaction_details.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Coin extends StatefulWidget {
  static final List<String> cryptoCardImages = <String>[
    'assets/images/bitcoin.png',
    'assets/images/tezos.png',
    'assets/images/ethereum.png',
  ];

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  final List cryptos = [
    ['Bitcoin', const BitCoinTransactionDetails()],
    ['Tezos', const TezosTransactionDetails()],
    ['Ethereum', const EthereumTransactionDetails()],
  ];

  final List<String> cryptoShortNames = <String>['BTC', 'XTZ', 'ETH'];

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Coins",
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  key: const ValueKey('LogoutKey'),
                  icon: const Icon(Icons.logout),
                  tooltip: 'Logout',
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
            centerTitle: false,
          ),
          body: Scrollbar(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: cryptos.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => cryptos[index][1]),
                      );
                    },
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      image: Image.asset(Coin.cryptoCardImages[index]),
                      showImage: true,
                      title: GFListTile(
                        title: Text(
                          cryptos[index][0].toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            color: NkapColors.accent,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subTitle: Row(
                          children: <Widget>[
                            Text(
                              'View all ${cryptoShortNames[index]} transactions',
                              style: const TextStyle(color: NkapColors.light),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            const Icon(
                              Icons.double_arrow,
                              color: NkapColors.accent,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ));
    });
  }
}
