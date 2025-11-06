import 'dart:convert';

import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDatasource {
  Future<Map<String, dynamic>> autenticate({
    required Map<String, dynamic> credentials,
  }) async {
    final result = await diohttp.post('$apiUrl/auth', data: credentials);

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> registerUser({
    required Map<String, dynamic> payload,
  }) async {
    final result = await diohttp.post('$apiUrl/auth/register', data: payload);
    print(result);

    return jsonDecode(result.toString());
  }
}
