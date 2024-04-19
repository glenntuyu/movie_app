part of 'map_detail_cubit.dart';

sealed class MapDetailState extends Equatable {
  const MapDetailState();

  @override
  List<Object> get props => [];
}

final class MapsInitial extends MapDetailState {}

final class GetMapsLoading extends MapDetailState {}

final class GetMapsLoaded extends MapDetailState {
  final List<MapsDataView> maps;

  const GetMapsLoaded({
    required this.maps,
  });}

final class GetMapsError extends MapDetailState {
  final String message;

  const GetMapsError({
    required this.message,
  });
}