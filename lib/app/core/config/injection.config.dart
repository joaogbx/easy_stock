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
import 'package:easy_stock/app/core/data/repositories/auth_repository.dart'
    as _i263;
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart'
    as _i236;
import 'package:easy_stock/app/core/utils/dio.dart' as _i696;
import 'package:easy_stock/app/ui/auth/cubit/auth_cubit.dart' as _i187;
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
    gh.lazySingleton<_i696.DioClient>(() => _i696.DioClient());
    gh.factory<_i236.IAuthRepository>(
      () => _i263.AuthRepository(gh<_i796.AuthDatasource>()),
    );
    gh.lazySingleton<_i375.AppCubit>(
      () => _i375.AppCubit(gh<_i236.IAuthRepository>()),
    );
    gh.lazySingleton<_i187.AuthCubit>(
      () => _i187.AuthCubit(gh<_i236.IAuthRepository>()),
    );
    return this;
  }
}
