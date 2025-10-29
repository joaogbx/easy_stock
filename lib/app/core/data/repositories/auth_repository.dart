import 'package:easy_stock/app/core/data/datasource/remote/auth_datasource.dart';
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
      return Result.success(User.fromMap(response ?? {}));
    } catch (error) {
      return Result.error('Erro ao autenticar: $error');
    }
  }
}
