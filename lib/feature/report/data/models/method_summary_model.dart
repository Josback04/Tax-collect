import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tax_collect/feature/report/domain/entities/method_summary_entity.dart';

part 'method_summary_model.g.dart';

@CopyWith()
@JsonSerializable(ignoreUnannotated: false)
class MethodSummaryModel extends MethodSummaryEntity {
  @JsonKey(name: 'method')
  final String? method;
  @JsonKey(name: 'total')
  final double total;
  @JsonKey(name: 'count')
  final int count;

  const MethodSummaryModel({
    this.method,
    this.total = 0.0,
    this.count = 0,
  });

  factory MethodSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$MethodSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MethodSummaryModelToJson(this);
}
