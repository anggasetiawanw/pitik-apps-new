import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

class Observers extends ProviderObserver {
  Log log = Log();
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log
      ..console('', type: LogType.debug)
      ..console('PROVIDER UPDATE', type: LogType.debug)
      ..console('==============================', type: LogType.debug)
      ..console('''"provider": "${provider.name ?? provider.runtimeType}"''', type: LogType.debug)
      ..console('''"newValue": "$newValue"''', type: LogType.debug)
      ..console('==============================\n', type: LogType.debug);
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic> provider, ProviderContainer container) {
    log
      ..console('', type: LogType.debug)
      ..console('PROVIDER DISPOSE', type: LogType.debug)
      ..console('==============================', type: LogType.debug)
      ..console('''"provider": "${provider.name ?? provider.runtimeType}"''', type: LogType.debug)
      ..console('''"newValue": "disposed"''', type: LogType.debug)
      ..console('==============================\n', type: LogType.debug);
    super.didDisposeProvider(provider, container);
  }
}
