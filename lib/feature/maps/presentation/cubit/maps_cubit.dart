import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'maps_state.dart';

@injectable
class MapsCubit extends Cubit<MapsState> {

  MapsCubit() : super(MapsInitial());
}
