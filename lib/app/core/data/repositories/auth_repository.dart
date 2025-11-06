import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/data/datasource/auth_datasource.dart';
import 'package:easy_stock/app/core/data/models/user_model.dart';

import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(this._dataSource, this._iSecureStorageService);
  final AuthDatasource _dataSource;
  final ISecureStorageService _iSecureStorageService;

  final logger = Logger();

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

  @override
  Future<Result> registerUser({required Map<String, dynamic> payload}) async {
    try {
      final response = await _dataSource.registerUser(payload: payload);

      _iSecureStorageService.write('token', response['data']['token']);

      return Result.success(User.fromMap(response['data']));
    } on DioException catch (error) {
      logger.e(error);
      return Result.error('Erro ao Criar usuário, ${error.response}');
    } catch (error) {
      return Result.error('Erro ao Criar usuário, $error');
    }
  }
}
