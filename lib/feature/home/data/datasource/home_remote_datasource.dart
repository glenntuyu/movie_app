import 'package:injectable/injectable.dart';

import '../../../../core/data/data.dart';
import '../../../../core/domain/common/model/model.dart';
import '../../domain/param/param.dart';

abstract class HomeRemoteDataSource {
  Future<BaseModel<MovieModel>> getMovies(GetMoviesPaginationParam param);
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient client;

  const HomeRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<BaseModel<MovieModel>> getMovies(GetMoviesPaginationParam param) {
    return client.get(
      ApiConstant.films,
      queryParameters: {
        'page': param.page,
      },
      converter: (e) => BaseModel.fromJson(
        e,
        (e) => MovieModel.fromJson(e),
      ),
    );
  }
}