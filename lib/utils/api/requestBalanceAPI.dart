import 'package:http/http.dart' as http;
import 'package:supbank_wallet/models/balanceModel.dart';
import 'dart:async' show Future;

Future<BalanceModel> showRequestBalanceAPI(int id) async {
  final url = "http://10.14.104.150:80/balanceapp";

  Map<String, dynamic> body = {
    'id': id,
  };

  final response = await http.get(url);

  //TODO PRINT RESPONSE
  print('GET Response code: ' +
      response.statusCode.toString() +
      "   " +
      response.body);

  return null;
}
