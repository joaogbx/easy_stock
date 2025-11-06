// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:easy_stock/app/core/cubit/app_cubit.dart' as _i375;
import 'package:easy_stock/app/core/data/datasource/auth_datasource.dart'
    as _i248;
import 'package:easy_stock/app/core/data/datasource/company_datasource.dart'
    as _i578;
import 'package:easy_stock/app/core/data/datasource/user_datasource.dart'
    as _i258;
import 'package:easy_stock/app/core/data/repositories/auth_repository.dart'
    as _i263;
import 'package:easy_stock/app/core/data/repositories/company_repository.dart'
    as _i120;
import 'package:easy_stock/app/core/data/repositories/user_repository.dart'
    as _i867;
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart'
    as _i236;
import 'package:easy_stock/app/core/domain/repositories/i_company_repository.dart'
    as _i1056;
import 'package:easy_stock/app/core/domain/repositories/i_user_repository.dart'
    as _i469;
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart'
    as _i144;
import 'package:easy_stock/app/core/infra/storage/secure_storage_service.dart'
    as _i916;
import 'package:easy_stock/app/core/utils/dio.dart' as _i696;
import 'package:easy_stock/app/ui/company/cubit/create_company_cubit.dart'
    as _i292;
import 'package:easy_stock/app/ui/user/screens/create_user/cubit/create_user_cubit.dart'
    as _i636;
import 'package:easy_stock/app/ui/user/screens/login/cubit/auth_cubit.dart'
    as _i514;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i248.AuthDatasource>(() => _i248.AuthDatasource());
    gh.factory<_i578.CompanyDatasource>(() => _i578.CompanyDatasource());
    gh.factory<_i258.UserDatasource>(() => _i258.UserDatasource());
    gh.lazySingleton<_i696.DioClient>(() => _i696.DioClient());
    gh.factory<_i1056.ICompanyRepository>(
      () => _i120.CompanyRepository(gh<_i578.CompanyDatasource>()),
    );
    gh.factory<_i469.IUserRepository>(
      () => _i867.UserRepository(gh<_i258.UserDatasource>()),
    );
    gh.factory<_i144.ISecureStorageService>(() => _i916.SecureStorageService());
    gh.factory<_i292.CreateCompanyCubit>(
      () => _i292.CreateCompanyCubit(
        gh<_i1056.ICompanyRepository>(),
        gh<_i469.IUserRepository>(),
      ),
    );
    gh.factory<_i236.IAuthRepository>(
      () => _i263.AuthRepository(
        gh<_i248.AuthDatasource>(),
        gh<_i144.ISecureStorageService>(),
      ),
    );
    gh.factory<_i514.AuthCubit>(
      () => _i514.AuthCubit(gh<_i236.IAuthRepository>()),
    );
    gh.lazySingleton<_i375.AppCubit>(
      () => _i375.AppCubit(gh<_i236.IAuthRepository>()),
    );
    gh.factory<_i636.CreateUserCubit>(
      () => _i636.CreateUserCubit(
        gh<_i469.IUserRepository>(),
        gh<_i236.IAuthRepository>(),
      ),
    );
    return this;
  }
}
