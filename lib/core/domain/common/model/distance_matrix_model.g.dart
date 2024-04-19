// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_matrix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistanceMatrixModel _$DistanceMatrixModelFromJson(Map<String, dynamic> json) =>
    DistanceMatrixModel(
      rows: DistanceMatrixModel._rowsFromJson(
          json['rows'] as Map<String, dynamic>?),
      originAddresses: (json['originAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      destinationAddresses: (json['destinationAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DistanceMatrixModelToJson(
        DistanceMatrixModel instance) =>
    <String, dynamic>{
      'originAddresses': instance.originAddresses,
      'destinationAddresses': instance.destinationAddresses,
      'rows': instance.rows,
    };
