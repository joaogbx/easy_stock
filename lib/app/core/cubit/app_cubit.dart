import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/data/models/user_model.dart';
import 'package:easy_stock/app/core/data/repositories/auth_repository.dart';
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit(this.iAuthRepository) : super(const AppState()) {}

  final IAuthRepository iAuthRepository;

  setUserLogged({required User user}) {
    emit(state.copyWith(userlogged: user));
  }
}
