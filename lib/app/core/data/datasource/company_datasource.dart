import 'dart:convert';

import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompanyDatasource {
  Future<Map<String, dynamic>> createCompany({
    required Map<String, dynamic> payload,
  }) async {
    final result = await diohttp.post('$apiUrl/company', data: payload);

    return jsonDecode(result.toString());
  }
}
