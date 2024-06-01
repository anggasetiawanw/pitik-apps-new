import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/exceptions/http_exception.dart';

class Response {
  final int code;
  final String? reasonPhrase;
  final dynamic data;

  Response({required this.code, this.reasonPhrase, this.data = const {}});
  @override
  String toString() {
    return 'code=$code\nstatusMessage=$reasonPhrase\n data=$data';
  }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
