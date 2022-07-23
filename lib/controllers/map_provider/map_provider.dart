import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:logger/logger.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:provider/provider.dart';
import '';


var mapProvider = Provider.of<ProviderMaps>(Get.context!,listen: false);


class ProviderMaps with ChangeNotifier {

  late LatLng _gpsactual;
  LatLng _initialposition = LatLng(-12.122711, -77.027475);
  bool activegps = true;
  TextEditingController locationController = TextEditingController();
  late GoogleMapController _mapController;
  LatLng get gpsPosition => _gpsactual;
  LatLng get initialPos => _initialposition;
  final Set<Marker> _markers = Set();
  final Set<Polyline> polyLine =Set();
  List<LatLng> routeCoord=[];
  PolylinePoints polylinePoints = PolylinePoints();

  Set<Marker> get markers => _markers;
  GoogleMapController get mapController => _mapController;
getSomePoints(googleAPiKey, originLatitude,originLongitude, _destLatitude, _destLongitud) async{
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(googleAPiKey,PointLatLng(originLatitude, originLatitude),PointLatLng(_destLatitude, _destLongitud));
}


  void getMoveCamera() async {
    List<Placemark> placemark = await placemarkFromCoordinates(
        _initialposition.latitude, _initialposition.longitude,
        localeIdentifier: "en_US");
    locationController.text = placemark[0].name!;
  }

  void getUserLocation() async {

    if (!(await Geolocator.isLocationServiceEnabled())) {
      activegps = false;
      await Geolocator.openLocationSettings();
    }
    else {
      activegps = true;
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return await Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemark =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      _initialposition = LatLng(position.latitude, position.longitude);

      print(
          "the latitude is: ${position.longitude} and the longitude is: ${position.longitude} ");
      locationController.text = placemark[0].name!;
      _addMarker(_initialposition, placemark[0].name!);
      _mapController.moveCamera(CameraUpdate.newLatLng(_initialposition));
      print("initial position is : ${placemark[0].name}");
      notifyListeners();
    }
  }

  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
    // polyLine.add(Polyline(polylineId: 'polylineId',
    // visible: true,
    //   width: 4,
    //   points: LatLng()
    // ), )
  }

  void _addMarker(LatLng location, String address) {
    _markers.add(Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "go here"),
        icon: BitmapDescriptor.defaultMarker));
    notifyListeners();
  }

  void onCameraMove(CameraPosition position) async {
   
    _initialposition = position.target;
    notifyListeners();
  }
}