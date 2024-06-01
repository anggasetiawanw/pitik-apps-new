import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.failure(AppException exception) = Failure;
  const factory LoginState.success() = Success;
  const factory LoginState.isFirstLogin() = IsFirstLogin;
  const factory LoginState.isDefaultPassword() = IsDefaultPassword;
}