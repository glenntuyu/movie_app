import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../core/domain/common/model/distance_matrix_model.dart';
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
    _getEta();
    super.initState();
  }

  void _getLocation() {
    context.read<MapDetailCubit>().getLocation();
  }

  void _getEta() {
    context.read<MapDetailCubit>().getEta();
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

    return Container(
      child: Stack(
        children: [
          _etaDetail(),
          _maps(),
        ],
      ),
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

  Widget _maps() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.long),
        zoom: 12,
      ),
      markers: markers,
    );
  }

  Widget _etaDetail() {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.vertical,
          runSpacing: 8,
          spacing: 8,
          children: [
            BlocBuilder<MapDetailCubit, MapDetailState>(
              buildWhen: (previous, current) => _etaBuildWhen(current),
              builder: (context, state) {
                DistanceMatrixModel? model = context.read<MapDetailCubit>().distanceMatrixModel;
                return _detailText(
                  'Origin Address', 
                  model?.originAddresses?.first ?? '',
                );
              },
            ),
            BlocBuilder<MapDetailCubit, MapDetailState>(
              buildWhen: (previous, current) => _etaBuildWhen(current),
              builder: (context, state) {
                DistanceMatrixModel? model =
                    context.read<MapDetailCubit>().distanceMatrixModel;
                return _detailText(
                  'Destination Address',
                  model?.destinationAddresses?.first ?? '',
                );
              },
            ),
            BlocBuilder<MapDetailCubit, MapDetailState>(
              buildWhen: (previous, current) => _etaBuildWhen(current),
              builder: (context, state) {
                DistanceMatrixModel? model =
                    context.read<MapDetailCubit>().distanceMatrixModel;
                return _detailText(
                  'ETA',
                  model?.rows?.first.elements?.first.duration?.text ?? '',
                );
              },
            ),
            BlocBuilder<MapDetailCubit, MapDetailState>(
              buildWhen: (previous, current) => _etaBuildWhen(current),
              builder: (context, state) {
                DistanceMatrixModel? model =
                    context.read<MapDetailCubit>().distanceMatrixModel;
                return _detailText(
                  'Range',
                  model?.rows?.first.elements?.first.distance?.text ?? '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _etaBuildWhen(MapDetailState current) =>
      current is GetMapEtaLoaded ||
      current is GetMapEtaLoading ||
      current is GetMapEtaError;

  Widget _detailText(String text, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "$text: $value",
        style: context.bodySmall,
      ),
    );
  }
}