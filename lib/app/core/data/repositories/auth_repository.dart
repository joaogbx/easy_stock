import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/data/datasource/auth_datasource.dart';
import 'package:easy_stock/app/core/data/models/user_model.dart';

import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthDatasource _dataSource;

  AuthRepository(this._dataSource);

  @override
  Future<Result> autenticate({required credentials}) async {
    try {
      final response = await _dataSource.autenticate(credentials: credentials);
      return Result.success(User.fromMap(response['data']));
    } on DioException catch (error) {
      return Result.error(
        error.response?.data['message'] ?? 'Erro ao autenticar usuário',
      );
    } catch (error) {
      return Result.error('Erro ao autenticar: $error');
    }
  }
}
