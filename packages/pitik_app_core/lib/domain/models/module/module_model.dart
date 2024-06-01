import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_model.freezed.dart';
part 'module_model.g.dart';

typedef ModuleList = List<Module>;

@freezed
class Module with _$Module {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Module({
    List<String>? downstreamApp,
  }) = _Module;

  factory Module.fromJson(dynamic json) => _$ModuleFromJson(json);
}
