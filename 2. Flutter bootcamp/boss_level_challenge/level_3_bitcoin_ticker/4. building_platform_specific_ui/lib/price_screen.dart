import 'dart:io' show Platform;

// ✅ dart 라이브러리 관리
// - 수 많은 라이브러리를 사용할 경우, Class 이름이 충돌되는 경우가 발생할 수 있음
// 1) as : 해당 라이브러리를 활용할 시, name space를 부여할 수 있음.
// 예를 들어 'A'와 'B'라이브러리 모두 'Home'이란 클래스가 존재할 경우 -> 이 때, Home을 호출하게 되면 무슨 라이브러리에서 사용하는지 불 분명함
// 따라서, 해당 라이브러리 > Home과 같은 클래스를 사용하기에 앞서, 'as' (사용하고자 하는 이름)을 사용하게 되면, 충돌 문제가 발생하지 않고, 보다 직관적으로 명시할 수 있음 (ex. import 'dart:io' as DartIO)

// 2) show : 해당 라이브러리의 '특정 클래스'만 활용
// 3) hide : 반대로 hide 키워드를 사용하면, 적힌 클래스를 제외한 클래스들만 사용이 가능

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  // widget

  // 🟢 DropdownButton (Android)
  DropdownButton androidDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: this.selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            if (value != null) {
              this.selectedCurrency = value;
            }
          });
        });
  }

  // 🟢 picker (iOS)
  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  // ✅ 플랫폼 별 체크 후, 피커 반환
  // dart:iO 참고 (platform이 모두 boolean 타입으로 설정되어 있음)
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropDown();
    }
    return SizedBox(); // 기본 반환값 추가
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.blueGrey[700],

            // ✅ iOS, Android 별 Widget 반환
            // 삼항연산자를 활용하자
            child: Platform.isIOS ? iOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}