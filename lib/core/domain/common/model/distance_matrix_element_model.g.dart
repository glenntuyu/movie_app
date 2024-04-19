// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_matrix_element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistanceMatrixElementModel _$DistanceMatrixElementModelFromJson(
        Map<String, dynamic> json) =>
    DistanceMatrixElementModel(
      distance: DistanceMatrixElementModel._distanceFromJson(
          json['distance'] as Map<String, dynamic>?),
      duration: DistanceMatrixElementModel._durationFromJson(
          json['duration'] as Map<String, dynamic>?),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DistanceMatrixElementModelToJson(
        DistanceMatrixElementModel instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'status': instance.status,
    };
