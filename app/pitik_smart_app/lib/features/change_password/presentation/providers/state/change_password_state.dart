import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

part 'change_password_state.freezed.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = Initial;
  const factory ChangePasswordState.loading() = Loading;
  const factory ChangePasswordState.failure(AppException exception) = Failure;
  const factory ChangePasswordState.success() = Success;
}
