import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../domain/model/maps_data_view.dart';
import '../cubit/maps_cubit.dart';
import 'dart:math';

@RoutePage()
class MapsPage extends StatefulWidget implements AutoRouteWrapper {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MapsCubit>(),
      child: this,
    );
  }
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    _getMaps();
    super.initState();
  }

  void _getMaps() {
    context.read<MapsCubit>().getMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<MapsCubit, MapsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetMapsLoaded) {
              return _body(state.maps);
            }
            return const LoadingWidget();
          },
        ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: _sectionTitle('All Cinema Location'),
      centerTitle: true,
      leadingWidth: 40,
      automaticallyImplyLeading: false,
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Text(
        text,
        style: context.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _body(List<MapsDataView> markers) {
    _setMarkers(markers);

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(markers.first.lat, markers.first.long),
        zoom: 12,
      ),
      onMapCreated: _onMapCreated,
      markers: this.markers,
    );
  }

  void _setMarkers(List<MapsDataView> markers) {
    for (var marker in markers) {
      this.markers.add(
        Marker(
          markerId: MarkerId(marker.name ?? ''),
          position: LatLng(marker.lat, marker.long),
          infoWindow: InfoWindow(title: marker.name ?? ''),
        )
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController?.moveCamera(CameraUpdate.newLatLngBounds(getBounds(markers.toList()), 100));
  }

  LatLngBounds getBounds(List<Marker> markers) {
    var lngs = markers.map<double>((m) => m.position.longitude).toList();
    var lats = markers.map<double>((m) => m.position.latitude).toList();

    double topMost = lngs.reduce(max);
    double leftMost = lats.reduce(min);
    double rightMost = lats.reduce(max);
    double bottomMost = lngs.reduce(min);

    LatLngBounds bounds = LatLngBounds(
      northeast: LatLng(rightMost, topMost),
      southwest: LatLng(leftMost, bottomMost),
    );

    return bounds;
  }
}
