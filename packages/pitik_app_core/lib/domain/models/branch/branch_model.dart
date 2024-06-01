import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

typedef BranchList = List<Branch>;

@freezed
class Branch with _$Branch {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Branch({
    String? id,
    String? name,
  }) = _Branch;

  const Branch._();

  factory Branch.fromJson(dynamic json) => _$BranchFromJson(json);
}
