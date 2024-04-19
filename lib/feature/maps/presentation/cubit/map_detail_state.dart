part of 'map_detail_cubit.dart';

sealed class MapDetailState extends Equatable {
  const MapDetailState();

  @override
  List<Object> get props => [];
}

final class MapDetailInitial extends MapDetailState {}

final class GetMapDetailLoading extends MapDetailState {}

final class GetMapDetailLoaded extends MapDetailState {
  final Position position;

  const GetMapDetailLoaded({
    required this.position,
  });
}

final class GetMapDetailError extends MapDetailState {
  final String message;

  const GetMapDetailError({
    required this.message,
  });
}