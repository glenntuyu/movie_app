part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetMoviesLoading extends HomeState {}

final class GetMoviesLoaded extends HomeState {
  final BaseModel<MovieModel> movies;

  const GetMoviesLoaded({
    required this.movies,
  });
}

final class GetMoviesError extends HomeState {
  final String message;

  const GetMoviesError({
    required this.message,
  });
}