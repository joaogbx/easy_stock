import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

//final apiUrl = 'http://192.168.100.8:3000';
const apiUrl = 'http://localhost:3000';
final diohttp = Dio(BaseOptions(baseUrl: apiUrl));
