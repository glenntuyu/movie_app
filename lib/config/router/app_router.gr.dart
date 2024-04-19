// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DetailRouteArgs>(
          orElse: () => DetailRouteArgs(
                id: pathParams.getInt('id'),
                title: queryParams.optString('title'),
                imageUrl: queryParams.optString('image_url'),
                source: queryParams.optString('source'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: DetailPage(
          key: args.key,
          id: args.id,
          title: args.title,
          imageUrl: args.imageUrl,
          source: args.source,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomePage()),
      );
    },
    MapDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<MapDetailRouteArgs>(
          orElse: () => MapDetailRouteArgs(
                lat: pathParams.getDouble('lat'),
                long: pathParams.getDouble('long'),
                title: queryParams.optString('title'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MapDetailPage(
          key: args.key,
          lat: args.lat,
          long: args.long,
          title: args.title,
        )),
      );
    },
    MapsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MapsPage()),
      );
    },
  };
}

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    required int id,
    String? title,
    String? imageUrl,
    String? source,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            id: id,
            title: title,
            imageUrl: imageUrl,
            source: source,
          ),
          rawPathParams: {'id': id},
          rawQueryParams: {
            'title': title,
            'image_url': imageUrl,
            'source': source,
          },
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const PageInfo<DetailRouteArgs> page = PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.id,
    this.title,
    this.imageUrl,
    this.source,
  });

  final Key? key;

  final int id;

  final String? title;

  final String? imageUrl;

  final String? source;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, id: $id, title: $title, imageUrl: $imageUrl, source: $source}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapDetailPage]
class MapDetailRoute extends PageRouteInfo<MapDetailRouteArgs> {
  MapDetailRoute({
    Key? key,
    required double lat,
    required double long,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          MapDetailRoute.name,
          args: MapDetailRouteArgs(
            key: key,
            lat: lat,
            long: long,
            title: title,
          ),
          rawPathParams: {
            'lat': lat,
            'long': long,
          },
          rawQueryParams: {'title': title},
          initialChildren: children,
        );

  static const String name = 'MapDetailRoute';

  static const PageInfo<MapDetailRouteArgs> page =
      PageInfo<MapDetailRouteArgs>(name);
}

class MapDetailRouteArgs {
  const MapDetailRouteArgs({
    this.key,
    required this.lat,
    required this.long,
    this.title,
  });

  final Key? key;

  final double lat;

  final double long;

  final String? title;

  @override
  String toString() {
    return 'MapDetailRouteArgs{key: $key, lat: $lat, long: $long, title: $title}';
  }
}

/// generated route for
/// [MapsPage]
class MapsRoute extends PageRouteInfo<void> {
  const MapsRoute({List<PageRouteInfo>? children})
      : super(
          MapsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
