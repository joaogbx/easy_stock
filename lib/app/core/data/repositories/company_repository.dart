import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/data/datasource/company_datasource.dart';

import 'package:easy_stock/app/core/data/models/company_model.dart';
import 'package:easy_stock/app/core/domain/repositories/i_company_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  CompanyRepository(this._companyDataSource);

  final CompanyDatasource _companyDataSource;

  @override
  Future<Result> createCompany({
    required String companyName,
    required int userId,
  }) async {
    final payload = {'name': companyName, 'owner_id': userId};

    try {
      final response = await _companyDataSource.createCompany(payload: payload);

      return Result.success(Company.fromJson(response['data']));
    } on DioException catch (error) {
      return Result.error(
        error.response?.data['message'] ?? 'Erro ao criar companhia',
      );
    } catch (error) {
      return Result.error('Erro ao Criar usuário, $error');
    }
  }
}
