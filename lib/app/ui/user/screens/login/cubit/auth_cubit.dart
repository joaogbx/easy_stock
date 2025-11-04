import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';
import 'package:easy_stock/app/core/domain/repositories/i_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._iAuthRepository, this._iUserRepository) : super(AuthState());

  final IAuthRepository _iAuthRepository;
  final IUserRepository _iUserRepository;

  autenticate({required String email, required String password}) async {
    final appCubit = getIt<AppCubit>();

    final credentials = {'email': email, 'password': password};

    final result = await _iAuthRepository.autenticate(credentials: credentials);

    print(result.error);

    if (result.isSuccess) {
      appCubit.setUserLogged(user: result.data);
    }
  }
}
