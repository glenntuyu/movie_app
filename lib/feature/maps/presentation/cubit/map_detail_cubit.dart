import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'map_detail_state.dart';

@injectable
class MapDetailCubit extends Cubit<MapDetailState> {

  MapDetailCubit() : super(MapDetailInitial());
}