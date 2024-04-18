import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/common/model/model.dart';
import '../../domain/param/param.dart';
import '../../home.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetTopRatedMoviesUseCase _getMoviesUseCase;

  HomeCubit(
    this._getMoviesUseCase,
  ) : super(HomeInitial());

  List<MovieModel>? movies;

 void getTopRatedMovies(int page) async {
    emit(GetTopRatedMoviesLoading());

    _getMoviesUseCase(GetMoviesPaginationParam(
      page: page,
    )).then((result) {
      result.fold(
        (failure) => emit(GetTopRatedMoviesError(message: failure.message)),
        (data) => emit(GetTopRatedMoviesLoaded(movies: data)),
      );
    });
  }
}