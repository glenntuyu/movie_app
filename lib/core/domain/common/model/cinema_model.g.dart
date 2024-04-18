// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaModel _$CinemaModelFromJson(Map<String, dynamic> json) => CinemaModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$CinemaModelToJson(CinemaModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'lat': instance.lat,
      'long': instance.long,
    };
