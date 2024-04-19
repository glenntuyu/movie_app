import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/common/model/distance_matrix_model.dart';

part 'map_detail_state.dart';

@injectable
class MapDetailCubit extends Cubit<MapDetailState> {

  MapDetailCubit() : super(MapDetailInitial());

  DistanceMatrixModel? distanceMatrixModel;

  void getLocation() async {
    emit(GetMapDetailLoading());

    await _checkPermissions().onError(
      (error, stackTrace) => Future.error(error!, stackTrace),
    );

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      // forceAndroidLocationManager: true,
      timeLimit: const Duration(seconds: 20),
    );

    emit(GetMapDetailLoaded(position: position));
  }

  Future<bool> _checkPermissions() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isServiceEnabled == false) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      return Future.error('Location services permission is denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location services permission is permanently denied');
    }
    return true;
  }
  
  void getEta() async {
    emit(GetMapEtaLoading());

    await Future.delayed(const Duration(seconds: 2));
    distanceMatrixModel = dummyDistanceMatrix;

    emit(GetMapEtaLoaded(distanceMatrixModel: distanceMatrixModel!));
  }
}