import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'distance_matrix_element_model.dart';
import 'distance_matrix_row_model.dart';
import 'distance_matrix_value_model.dart';

part 'distance_matrix_model.g.dart';

@JsonSerializable()
class DistanceMatrixModel extends Equatable {
  const DistanceMatrixModel({
    required this.rows,
    required this.originAddresses,
    required this.destinationAddresses,
  });

  @JsonKey(name: 'originAddresses')
  final List<String>? originAddresses;

  @JsonKey(name: 'destinationAddresses')
  final List<String>? destinationAddresses;

  @JsonKey(
    fromJson: _rowsFromJson,
  )
  final List<DistanceMatrixRowModel>? rows;

  static List<DistanceMatrixRowModel>? _rowsFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return (json['rows'] as List<dynamic>?)
        ?.map((e) => DistanceMatrixRowModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory DistanceMatrixModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceMatrixModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceMatrixModelToJson(this);

  @override
  List<Object?> get props => [
        rows,
        originAddresses,
        destinationAddresses,
      ];
}

const dummyDistanceMatrix = DistanceMatrixModel(
  rows: [
    DistanceMatrixRowModel(
      elements: [
        DistanceMatrixElementModel(
          distance: DistanceMatrixValueModel(
            text: "12,5 km", 
            value: 125,
          ),
          duration: DistanceMatrixValueModel(
            text: "45 minutes", 
            value: 2700,
          ),
          status: "OK",
        ),
      ]
    )
  ],
  originAddresses: [
    "5 Great Carleton Pl, Edinburgh EH16 4TX, UK",
    "Greenwich, London, UK",
  ],
  destinationAddresses: [
    "Stockholm, Sweden",
    "Staroměstské nám. 1/3, Staré Město, 110 00 Praha-Praha 1, Czechia",
  ],
);