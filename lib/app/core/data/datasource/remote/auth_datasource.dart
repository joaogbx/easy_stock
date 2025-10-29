import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/dio/dio.dart';
import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDatasource {
  final Dio dio;

  const AuthDatasource(this.dio);

  Future<Map<String, dynamic>> autenticate({
    required Map<String, dynamic> credentials,
  }) async {
    final result = await dio.post('$apiUrl/auth', data: credentials);

    return jsonDecode(result.toString());
  }
}
