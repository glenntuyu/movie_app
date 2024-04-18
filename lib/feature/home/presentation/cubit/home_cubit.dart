import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/common/model/model.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<MovieModel>? movies;

  // TODO: using real data
  void getMovies({int page = -1}) async {
    emit(GetMoviesLoading());

    await Future.delayed(const Duration(seconds: 3));
    emit(GetMoviesLoaded(
      movies: BaseModel(
        count: 6,
        next: null,
        previous: null,
        results: dummyMovies,
      ),
    ));
  }
}