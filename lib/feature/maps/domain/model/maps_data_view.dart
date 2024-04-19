import 'package:equatable/equatable.dart';

class MapsDataView extends Equatable {
  const MapsDataView({
    required this.name,
    required this.lat,
    required this.long,
  });

  final String? name;
  final double lat, long;
  
  @override
  List<Object?> get props => [
        name,
        lat,
        long,
      ];
}