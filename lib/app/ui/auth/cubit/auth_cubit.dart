import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.iAuthRepository) : super(AuthState()) {}

  final IAuthRepository iAuthRepository;

  autenticate({required String email, required String password}) async {
    final appCubit = getIt<AppCubit>();

    final credentials = {'email': email, 'password': password};

    final result = await iAuthRepository.autenticate(credentials: credentials);

    print(result.error);

    if (result.isSuccess) {
      appCubit.setUserLogged(user: result.data);
      print('usuario logado');
    }
  }
}
