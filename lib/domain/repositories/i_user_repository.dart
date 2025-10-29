import 'package:easy_stock/domain/models/user_model.dart';

abstract class IUserRepository {
  Future<User> createUser({required Map<String, dynamic> payload});
  Future<User> updateUser({
    required int userId,
    required Map<String, dynamic> payload,
  });
}
