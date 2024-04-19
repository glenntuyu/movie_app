import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'distance_matrix_value_model.dart';

part 'distance_matrix_element_model.g.dart';

@JsonSerializable()
class DistanceMatrixElementModel extends Equatable {
  const DistanceMatrixElementModel({
    required this.distance,
    required this.duration,
    required this.status,
  });

  @JsonKey(
    fromJson: _distanceFromJson,
  )
  final DistanceMatrixValueModel? distance;

  static DistanceMatrixValueModel? _distanceFromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return (json['distance'] as dynamic)
        ?.map((e) => DistanceMatrixValueModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @JsonKey(
    fromJson: _durationFromJson,
  )
  final DistanceMatrixValueModel? duration;

  static DistanceMatrixValueModel? _durationFromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return (json['duration'] as dynamic)
        ?.map(
            (e) => DistanceMatrixValueModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @JsonKey(name: 'status')
  final String? status;

  factory DistanceMatrixElementModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceMatrixElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceMatrixElementModelToJson(this);

  @override
  List<Object?> get props => [
        distance,
        duration,
        status,
      ];
}
