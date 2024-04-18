import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/data.dart';
import '../../../../core/domain/common/model/model.dart';
import '../../data/datasource/datasource.dart';
import '../param/param.dart';

abstract class HomeRepository {
  Future<Either<Failure, BaseModel<MovieModel>>> getMovies(GetMoviesPaginationParam param,);
}

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, BaseModel<MovieModel>>> getMovies(GetMoviesPaginationParam param,) {
    return RepositoryUtil.catchOrThrow(
      body: () async {
        final response = await remoteDataSource.getMovies(param,);
        return response;
      },
    );
  }
}