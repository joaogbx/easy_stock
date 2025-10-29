import 'package:dio/dio.dart';
import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: apiUrl, receiveTimeout: const Duration(seconds: 10)),
  );
}
