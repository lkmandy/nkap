import 'package:flutter/material.dart';
import 'package:nkap/colors/colors.dart';

class Coin extends StatelessWidget {
  final List<String> cryptos = <String>['Bitcoin', 'Tezos', 'Ethereum'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coins", ),//style:TextStyle(color: NkapColors.primary,),),
        centerTitle: false,
      ),
     body: Scrollbar(
       child: ListView.builder(
          scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: cryptos.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.blue,
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(cryptos[index]),
                  )
              );
            }
        ),
     ),
    );
  }
}
