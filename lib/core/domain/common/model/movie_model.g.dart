// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String?,
      episodeId: json['episode_id'] as int,
      openingCrawl: json['opening_crawl'] as String?,
      director: json['director'] as String?,
      producer: json['producer'] as String?,
      releaseDate: json['release_date'] as String?,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      planets:
          (json['planets'] as List<dynamic>).map((e) => e as String).toList(),
      starships:
          (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
      vehicles:
          (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      species:
          (json['species'] as List<dynamic>).map((e) => e as String).toList(),
      created: json['created'] as String?,
      edited: json['edited'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'episode_id': instance.episodeId,
      'opening_crawl': instance.openingCrawl,
      'director': instance.director,
      'producer': instance.producer,
      'release_date': instance.releaseDate,
      'characters': instance.characters,
      'planets': instance.planets,
      'starships': instance.starships,
      'vehicles': instance.vehicles,
      'species': instance.species,
      'created': instance.created,
      'edited': instance.edited,
      'url': instance.url,
    };
