import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// Get Coin data
class CoinData {
  static const baseUri = 'https://rest.coinapi.io/v1/exchangerate/';
  static const apikey = '62193036-A428-4209-AB46-95870A1FE95F';

  // 선택하는 pikcer의 value가 currency이니, 해당 값을 인자로 받아서 crypto값을 받아오는 방식으로 활용할 것
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    // map을 활용하여 crypto : currency(rate) 형식으로 생성할 것
    Map<String, String> coinData = {};

    for (String crypto in cryptoList) {
      final url = '${baseUri}$crypto/$selectedCurrency?apikey=$apikey'; 

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        double currencyRate = decodedResponse['rate'];

        // ✅ toStringAsFixed()
        // 숫자(num, int, double)를 소수점 () 자리까지 잘라서 문자열로 반환
        coinData[crypto] = currencyRate.toStringAsFixed(0);
      } else {
        print('error');
      }
    }

    return coinData;
  }
}