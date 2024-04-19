import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distance_matrix_value_model.g.dart';

@JsonSerializable()
class DistanceMatrixValueModel extends Equatable {
  const DistanceMatrixValueModel({
    required this.text,
    required this.value,
  });

  @JsonKey(name: 'text')
  final String? text;

  @JsonKey(name: 'value')
  final int? value;

  factory DistanceMatrixValueModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceMatrixValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceMatrixValueModelToJson(this);

  @override
  List<Object?> get props => [
        text,
        value,
      ];
}
