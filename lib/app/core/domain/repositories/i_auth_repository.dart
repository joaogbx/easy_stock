import 'package:easy_stock/app/core/result/result.dart';

abstract class IAuthRepository {
  Future<Result> autenticate({required credentials});
}
