part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetTopRatedMoviesLoading extends HomeState {}

final class GetTopRatedMoviesLoaded extends HomeState {
  final BaseModel<MovieModel> movies;

  const GetTopRatedMoviesLoaded({
    required this.movies,
  });
}

final class GetTopRatedMoviesError extends HomeState {
  final String message;

  const GetTopRatedMoviesError({
    required this.message,
  });
}

final class GetCinemaLoading extends HomeState {}

final class GetCinemaLoaded extends HomeState {
  final List<CinemaModel> cinemas;

  const GetCinemaLoaded({
    required this.cinemas,
  });
}

final class GetCinemaError extends HomeState {
  final String message;

  const GetCinemaError({
    required this.message,
  });
}
