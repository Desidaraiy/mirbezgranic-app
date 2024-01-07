import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/models/clusterized_icon_painter.dart';
import 'package:mirbezgranic/models/place_point.dart';
import 'package:mirbezgranic/repository/mapRepository.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/func.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late YandexMapController _mapController;

  List<PlacemarkMapObject>? _myPlacemarkMapObjects;

  var _mapZoom = 12.0;

  CameraPosition? _userLocation;

  Future<void> _initLocationLayer() async {
    // final locationPermissionIsGranted =
    //     await Permission.location.request().isGranted;

    // if (locationPermissionIsGranted) {
    //   await _mapController.toggleUserLayer(visible: true);
    // } else {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Нет доступа к местоположению пользователя'),
    //       ),
    //     );
    //   });
    // }

    Point target = Point(latitude: 58.522857, longitude: 31.269816);

    CameraPosition _cameraPosition = new CameraPosition(target: target);

    _mapZoom = 12.0;

    await _mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        _cameraPosition.copyWith(zoom: 12),
      ),
      animation: const MapAnimation(
        type: MapAnimationType.linear,
        duration: 0.3,
      ),
    );
  }

  Future<List<PlacePoint>> _getMapPoints() async {
    List<PlacePoint> _list = await MapRepository.getMapPoints();
    return _list;
  }

  Future<List<PlacemarkMapObject>> _getPlacemarkObjects(
      BuildContext context) async {
    final _list = await _getMapPoints();
    return _list
        .map(
          (point) => PlacemarkMapObject(
            mapId:
                MapObjectId('MapObject ${point.longitude}-${point.latitude}'),
            point: Point(latitude: point.latitude, longitude: point.longitude),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/icons/map_point.png',
                ),
                scale: 3,
              ),
            ),
            onTap: (_, __) => showModalBottomSheet(
              context: context,
              enableDrag: true,
              isScrollControlled: true,
              builder: (context) => _ModalBodyView(
                point: point,
              ),
            ),
          ),
        )
        .toList();
  }

  /// Метод для получения коллекции кластеризованных маркеров
  ClusterizedPlacemarkCollection _getClusterizedCollection({
    required List<PlacemarkMapObject> placemarks,
  }) {
    return ClusterizedPlacemarkCollection(
        mapId: MapObjectId('clusterized-${DateTime.now()}'),
        placemarks: placemarks,
        radius: 50,
        minZoom: 15,
        onClusterAdded: (self, cluster) async {
          return cluster.copyWith(
            appearance: cluster.appearance.copyWith(
              opacity: 1.0,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromBytes(
                    await ClusterIconPainter(cluster.size)
                        .getClusterIconBytes(),
                  ),
                ),
              ),
            ),
          );
        },
        onClusterTap: (self, cluster) async {
          await _mapController.moveCamera(
            animation: const MapAnimation(
                type: MapAnimationType.linear, duration: 0.3),
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: cluster.placemarks.first.point,
                zoom: _mapZoom + 2,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlacemarkMapObject>>(
      future: _getPlacemarkObjects(context),
      builder: (BuildContext context,
          AsyncSnapshot<List<PlacemarkMapObject>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Ошибка при загрузке данных');
        } else if (snapshot.hasData) {
          // final items = snapshot.data;
          _myPlacemarkMapObjects ??= snapshot.data!;
          return YandexMap(
              onMapCreated: (controller) async {
                _mapController = controller;
                await _initLocationLayer();
              },
              // onUserLocationAdded: (view) async {
              //   _userLocation = await _mapController.getUserCameraPosition();
              //   if (_userLocation != null) {
              //     await _mapController.moveCamera(
              //       CameraUpdate.newCameraPosition(
              //         _userLocation!.copyWith(zoom: 10),
              //       ),
              //       animation: const MapAnimation(
              //         type: MapAnimationType.linear,
              //         duration: 0.3,
              //       ),
              //     );
              //   }
              //   return view.copyWith(
              //     pin: view.pin.copyWith(
              //       opacity: 1,
              //     ),
              //   );
              // },
              onCameraPositionChanged: (cameraPosition, _, __) {
                // setState(() {
                _mapZoom = cameraPosition.zoom;
                // });
              },
              // mapObjects: snapshot.data!,
              mapObjects: [
                _getClusterizedCollection(
                  placemarks: _myPlacemarkMapObjects!,
                )
              ]);
        } else {
          return Container();
        }
      },
    );
  }
}

class _ModalBodyView extends StatelessWidget {
  const _ModalBodyView({required this.point});

  final PlacePoint point;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CachedNetworkImage(
            imageUrl: point.imageUrl!,
            fit: BoxFit.cover,
            placeholder: (context, w) {
              return Container(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()));
            },
            errorWidget: (context, url, error) {
              return Container(
                  height: 200, child: Center(child: Text('Ошибка загрузки')));
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            point.name,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.smokyBlack),
          ),
        ),
        const SizedBox(height: 10),
        point.address != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  point.address!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.smokyBlack),
                ),
              )
            : Container(),
        const SizedBox(height: 10),
        point.description != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  point.description!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.smokyBlack),
                ),
              )
            : Container(),
        const SizedBox(height: 10),
        point.hours != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  point.hours!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.smokyBlack),
                ),
              )
            : Container(),
        const SizedBox(height: 10),
        ButtonWithIcon(
            onPressed: () {
              Navigator.of(context).pop();
              Utils.launchURL(
                  "https://yandex.ru/maps/?rtext=~${point.latitude},${point.longitude}&rtt=mt");
            },
            label: 'ПОСТРОИТЬ МАРШРУТ'),
        const SizedBox(height: 10),
      ],
    );
  }
}
