import 'package:easy_stock/domain/models/user_model.dart';

abstract class IAuthRepository {
  Future<User> autenticate({required credentials});
}
