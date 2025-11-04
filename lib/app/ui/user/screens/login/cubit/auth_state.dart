part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    @Default(false) bool loading,
    @Default(null) String? errorMessage,
  }) = _AuthState;
}
