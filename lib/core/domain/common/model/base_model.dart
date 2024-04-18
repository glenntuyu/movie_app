import 'package:equatable/equatable.dart';
import 'package:movie_app/core/core.dart';

class BaseModel<T> extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<T> results;

  const BaseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json, Function fromJsonT) {
    return BaseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
              ?.map<T>((post) => fromJsonT(post))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson(List<dynamic> post) {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results,
    };
  }

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];

  int? getNextPage() {
    String? next = this.next;

    if (next == null) {
      return null;
    } else {
      final parsedUrl = Uri.parse(next);
      String? page = parsedUrl.queryParameters[ApiConstant.page];

      if (page == null) {
        return null;
      } else {
        return int.parse(page);
      }
    }
  
  }
}