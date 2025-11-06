import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/data/models/user_model.dart';
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
  AuthCubit(
    this._iAuthRepository,
  ) : super(AuthState());

  final IAuthRepository _iAuthRepository;

  autenticate({
    required String email,
    required String password,
  }) async {
    print('DEBUG: [AuthCubit] -> Início do método autenticate.');

    // 1. Limpa o erro anterior e ativa o loading
    emit(
      state.copyWith(
        loading: true,
        errorMessage: null, // Limpa o erro ao iniciar
      ),
    );

    try {
      final appCubit = getIt<AppCubit>();
      print('DEBUG: [AuthCubit] -> AppCubit injetado com sucesso.');

      final credentials = {'email': email, 'password': password};

      print('DEBUG: [AuthCubit] -> Chamando o repositório...');

      // 2. Tenta chamar o repositório
      final result = await _iAuthRepository.autenticate(
        credentials: credentials,
      );

      print('DEBUG: [AuthCubit] -> Resposta do repositório recebida.');

      if (result.isError) {
        print('DEBUG: [AuthCubit] -> Erro: ${result.error}');
        emit(state.copyWith(errorMessage: result.error));
      }

      if (result.isSuccess) {
        print('DEBUG: [AuthCubit] -> Sucesso. Definindo usuário logado.');

        // Use o estado do AuthCubit para guardar o User Model
        emit(state.copyWith(user: result.data));

        // Notifica o AppCubit sobre a mudança de status global
        appCubit.setUserLogged(user: result.data);
      }
    } catch (e, stack) {
      // Caso a injeção ou qualquer outra coisa falhe antes do loading: false
      print('DEBUG: [AuthCubit] -> Exceção Capturada: $e');
      print('DEBUG: [AuthCubit] -> Stack Trace: $stack');
      emit(state.copyWith(errorMessage: 'Ocorreu um erro inesperado: $e'));
    }

    // 3. Desativa o loading, garantindo que é a última emissão
    print('DEBUG: [AuthCubit] -> Finalizando loading.');
    emit(state.copyWith(loading: false));
  }
}
