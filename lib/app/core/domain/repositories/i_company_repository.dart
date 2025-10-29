import 'package:easy_stock/app/core/data/models/company_model.dart';

abstract class ICompanyRepository {
  Future<Company> createCompany({required Map<String, dynamic> payload});
}
