import 'dart:convert';

import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDatasource {
  const AuthDatasource();

  Future<Map<String, dynamic>> autenticate({
    required Map<String, dynamic> credentials,
  }) async {
    final result = await diohttp.post('$apiUrl/auth', data: credentials);

    return jsonDecode(result.toString());
  }
}
