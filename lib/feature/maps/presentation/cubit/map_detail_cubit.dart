import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/common/model/cinema_model.dart';
import '../../domain/model/maps_data_view.dart';

part 'map_detail_state.dart';

@injectable
class MapDetailCubit extends Cubit<MapDetailState> {

  var maps = <MapsDataView>[];

  MapDetailCubit() : super(MapsInitial());

  void getMaps() async {
    emit(GetMapsLoading());

    await Future.delayed(const Duration(seconds: 2));
    for (var cinema in dummyCinemas) {
      maps.add(
        MapsDataView(
          name: cinema.name, 
          lat: cinema.lat, 
          long: cinema.long,
        )
      );
    }
    emit(GetMapsLoaded(maps: maps));
  }
}
