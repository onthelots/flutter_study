import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  // method
  // ✅ For loops를 활용한 Dropdown Item 생성하기
  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }

    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {

    this.getDropdownItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.blueGrey[500],
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

          // ✅ drop_down widget
          // 참고 (https://api.flutter.dev/flutter/material/DropdownButton-class.html)
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.blueGrey[700],

            // 타입 설정 (tring)
            child: DropdownButton<String>(
                // 🟢 value (실제로 설정된, UI상에 나타나는 String 값) - 초기값 또한 활용 가능
                value: this.selectedCurrency,
                // 🟢 DropdownMenuItem (child - Widget)
                items: getDropdownItems(),

                // 🟢 onChanged (items 중, 선택된 'value'를 전달받음)
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      this.selectedCurrency = value;
                    }
                  });
                }),
          ),
        ],
      ),
    );
  }
}
