import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cinema_model.g.dart';

@JsonSerializable()
class CinemaModel extends Equatable {
  const CinemaModel({
    required this.name,
    required this.url,
    required this.lat,
    required this.long,
  });

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'lat')
  final double lat;

  @JsonKey(name: 'long')
  final double long;

  factory CinemaModel.fromJson(Map<String, dynamic> json) =>
      _$CinemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        url,
        lat,
        long,
      ];
}

const dummyCinemas = [
  CinemaModel(
    name: 'CGV Paris Van Java',
    url : '/a1fo3bps2zt5hEQspmC7UMGtuVl.jpg',
    lat: -6.88759765381391,
    long: 107.59562374924268,
  ),
  CinemaModel(
    name: 'CGV 23',
    url : '/a1fo3bps2zt5hEQspmC7UMGtuVl.jpg',
    lat: -6.914802657301034,
    long: 107.5943842,
  ),
  CinemaModel(
    name: 'CGV Miko Mall',
    url : '/a1fo3bps2zt5hEQspmC7UMGtuVl.jpg',
    lat: -6.95979454547178,
    long: 107.58044603859987,
  ),
  CinemaModel(
    name: 'CGV BEC',
    url : '/a1fo3bps2zt5hEQspmC7UMGtuVl.jpg',
    lat: -6.9073447560442425,
    long: 107.60890027370743,
  ),
  CinemaModel(
    name: 'CGV Kings',
    url : '/a1fo3bps2zt5hEQspmC7UMGtuVl.jpg',
    lat: -6.922858132454244, 
    long: 107.60498066087331,
  ),
];