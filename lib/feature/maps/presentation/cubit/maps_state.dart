part of 'maps_cubit.dart';

sealed class MapsState extends Equatable {
  const MapsState();

  @override
  List<Object> get props => [];
}

final class MapsInitial extends MapsState {}

final class GetMapsLoading extends MapsState {}

final class GetMapsLoaded extends MapsState {}

final class GetMapsError extends MapsState {}