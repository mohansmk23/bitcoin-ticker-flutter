import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency;

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: currency,
      items: items,
      onChanged: (value) {
        setState(() {
          currency = value;
        });
      },
    );
  }

  CupertinoPicker IOSpicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isAndroid ? getDropdownButton() : IOSpicker()),
        ],
      ),
    );
  }
}
