import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  const MovieModel({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  
  @JsonKey(name: 'title')
  final String title;
  
  @JsonKey(name: 'episode_id')
  final int episodeId;
  
  @JsonKey(name: 'opening_crawl')
  final String? openingCrawl;
  
  @JsonKey(name: 'director')
  final String? director;
  
  @JsonKey(name: 'producer')
  final String? producer;
  
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'characters')
  final List<String> characters;

  @JsonKey(name: 'planets')
  final List<String> planets;

  @JsonKey(name: 'starships')
  final List<String> starships;

  @JsonKey(name: 'vehicles')
  final List<String> vehicles;

  @JsonKey(name: 'species')
  final List<String> species;
  
  @JsonKey(name: 'created')
  final String? created;
  
  @JsonKey(name: 'edited')
  final String? edited;
  
  @JsonKey(name: 'url')
  final String? url;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        episodeId,
        openingCrawl,
        director,
        producer,
        releaseDate,
        characters,
        planets,
        starships,
        vehicles,
        species,
        created,
        edited,
        url,
      ];
}