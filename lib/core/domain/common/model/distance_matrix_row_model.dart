
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'distance_matrix_element_model.dart';

part 'distance_matrix_row_model.g.dart';

@JsonSerializable()
class DistanceMatrixRowModel extends Equatable {
  const DistanceMatrixRowModel({
    required this.elements,
  });

  @JsonKey(
    fromJson: _elementsFromJson,
  )
  final List<DistanceMatrixElementModel>? elements;

  static List<DistanceMatrixElementModel>? _elementsFromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return (json['elements'] as List<dynamic>?)
        ?.map((e) => DistanceMatrixElementModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory DistanceMatrixRowModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceMatrixRowModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceMatrixRowModelToJson(this);

  @override
  List<Object?> get props => [
        elements,
      ];

}