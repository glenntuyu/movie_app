import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../cubit/map_detail_cubit.dart';

@RoutePage()
class MapDetailPage extends StatefulWidget implements AutoRouteWrapper {
  final double lat, long;
  final String? title;

  const MapDetailPage({
    super.key,
    @PathParam('lat') required this.lat,
    @PathParam('long') required this.long,
    @QueryParam('title') this.title,
  });

  @override
  State<MapDetailPage> createState() => _MapDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MapDetailCubit>(),
      child: this,
    );
  }
}

class _MapDetailPageState extends State<MapDetailPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  
   @override
  void initState() {
    _getLocation();
    super.initState();
  }

  void _getLocation() {
    context.read<MapDetailCubit>().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<MapDetailCubit, MapDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetMapDetailLoaded) {
              return _body(state.position);
            }
            return const LoadingWidget();
          },
        ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        widget.title ?? 'Maps',
        style: context.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leadingWidth: 40,
      automaticallyImplyLeading: false,
    );
  }

  Widget _body(Position position) {
    _setMarkers(position);

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.long),
        zoom: 12,
      ),
      markers: markers,
    );
  }

  void _setMarkers(Position position) {
      markers.add(
        Marker(
          markerId: const MarkerId('userLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: const InfoWindow(title: 'Your Location'),
        )
      );
      markers.add(
         Marker(
          markerId: MarkerId(widget.title ?? ''),
          position: LatLng(widget.lat, widget.long),
          infoWindow: InfoWindow(title: widget.title ?? ''),
        )
      );
  }
}