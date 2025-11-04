import 'dart:convert';

import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDatasource {
  Future<Map<String, dynamic>> createUser({
    required Map<String, dynamic> payload,
  }) async {
    final result = await diohttp.post('$apiUrl/user', data: payload);

    return jsonDecode(result.toString());
  }
}
