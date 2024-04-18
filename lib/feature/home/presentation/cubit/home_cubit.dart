import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/common/model/model.dart';
import '../../../../core/domain/common/model/cinema_model.dart';
import '../../domain/param/param.dart';
import '../../home.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetTopRatedMoviesUseCase _getMoviesUseCase;

  List<CinemaModel>? cinemas;

  HomeCubit(
    this._getMoviesUseCase,
  ) : super(HomeInitial());

  void getCinemas() async {
    emit(GetCinemaLoading());

    await Future.delayed(const Duration(seconds: 2));
    cinemas = dummyCinemas;
    emit(GetCinemaLoaded(cinemas: cinemas ?? []));
  }

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
