import 'package:easy_stock/domain/models/company_model.dart';

abstract class ICompanyRepository {
  Future<Company> createCompany({required Map<String, dynamic> payload});
}
