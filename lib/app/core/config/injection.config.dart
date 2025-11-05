// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:easy_stock/app/core/cubit/app_cubit.dart' as _i375;
import 'package:easy_stock/app/core/data/datasource/remote/auth_datasource.dart'
    as _i796;
import 'package:easy_stock/app/core/data/datasource/remote/company_datasource.dart'
    as _i913;
import 'package:easy_stock/app/core/data/datasource/remote/user_datasource.dart'
    as _i11;
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
import 'package:easy_stock/app/core/utils/dio.dart' as _i696;
import 'package:easy_stock/app/ui/user/screens/create_company/cubit/create_company_cubit.dart'
    as _i711;
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
    gh.factory<_i796.AuthDatasource>(() => const _i796.AuthDatasource());
    gh.factory<_i913.CompanyDatasource>(() => _i913.CompanyDatasource());
    gh.factory<_i11.UserDatasource>(() => _i11.UserDatasource());
    gh.lazySingleton<_i696.DioClient>(() => _i696.DioClient());
    gh.factory<_i469.IUserRepository>(
      () => _i867.UserRepository(gh<_i11.UserDatasource>()),
    );
    gh.factory<_i1056.ICompanyRepository>(
      () => _i120.CompanyRepository(gh<_i913.CompanyDatasource>()),
    );
    gh.factory<_i636.CreateUserCubit>(
      () => _i636.CreateUserCubit(gh<_i469.IUserRepository>()),
    );
    gh.factory<_i236.IAuthRepository>(
      () => _i263.AuthRepository(gh<_i796.AuthDatasource>()),
    );
    gh.factory<_i711.CreateCompanyCubit>(
      () => _i711.CreateCompanyCubit(
        gh<_i1056.ICompanyRepository>(),
        gh<_i469.IUserRepository>(),
      ),
    );
    gh.lazySingleton<_i375.AppCubit>(
      () => _i375.AppCubit(gh<_i236.IAuthRepository>()),
    );
    gh.factory<_i514.AuthCubit>(
      () => _i514.AuthCubit(
        gh<_i236.IAuthRepository>(),
        gh<_i469.IUserRepository>(),
      ),
    );
    return this;
  }
}
