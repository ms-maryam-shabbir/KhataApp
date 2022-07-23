//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:practice/firebaseData/listenLocation.dart';
// import 'package:practice/firebaseData/read_write.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/map_provider/map_provider.dart';
// import 'package:location/location.dart';
//
// class GoogleMaps extends StatefulWidget {
//   const GoogleMaps({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleMaps> createState() => _GoogleMapsState();
// }
//
// class _GoogleMapsState extends State<GoogleMaps> {
//   String address = 'search';
//   Location location = new Location();
//   bool? _serviceEnabled;
//   PermissionStatus? _permissionGranted;
//   LocationData? _locationData;
//   FirebaseLocationListen locationListen= FirebaseLocationListen.instance;
// var lat;
// var lng;
//   @override
//   void initState() {
//     super.initState();
//     _listenLocation();
//   locationListen.locationListener(lat, lng);
//   locationListen.locationListener(lat, lng);
//     setState((){});
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     if(location!=null){
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return SafeArea(
//       child: Scaffold(
//         body: Consumer<ProviderMaps>(builder: (context, data, child) {
//           return Stack(children: [
//             Center(
//               child: SizedBox(
//                   height: Get.height,
//                   width: Get.width,
//                   child: GoogleMap(
//                     initialCameraPosition: CameraPosition(
//                       target: LatLng(31.5716654, 74.3896568),
//                       zoom: 14.4746,
//                     ),
//                     markers: data.markers,
//                     onCameraMove: data.onCameraMove,
//                     compassEnabled: true,
//                     myLocationEnabled: true,
//                     myLocationButtonEnabled: true,
//                     onMapCreated: data.onCreated,
//                     // polylines: data.getSomePoints('AIzaSyB7nhCqDzMgY3Mbf4PX5ipHeM9oZErtwB8',31.5716654, 74.3896568,31.5715454, 74.389645568),
//                     polylines: {
//                       Polyline(polylineId: PolylineId("value"),points: [LatLng(15.564545, 15.45454)]),
//                       Polyline(polylineId: PolylineId("value2"),points: [LatLng(158415.4847567, 154555.45454)])
//                     },
//                   )),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text('${lat}'),
//                 Text('${lng}'),
//                 ElevatedButton(
//                     onPressed: () async {
//                       data.getUserLocation();
//                     },
//                     child: Text('Get Location'))
//               ],
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Icon(
//                 Icons.location_on,
//                 size: 50,
//                 color: Colors.redAccent,
//               ),
//             )
//           ]);
//         }),
//       ),
//     );
//   }
//
//   _listenLocation()async{
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled!) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled!) {
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     _locationData = await location.getLocation();
//     location.enableBackgroundMode(enable: true);
//     location.onLocationChanged.listen((LocationData currentLocation)async {
//       _locationData=currentLocation;
//       setState((){
//       });
//
//       await firestore.collection('locationUpdate').doc('hamzamuazzam').set({
//         'lat':currentLocation.latitude,
//         'lng':currentLocation.longitude,
//       });
//       });
//
//   }
//
// // void getCurrentLocation() async{
// //
// //   Position position = await _getGeoLocationPosition();
// //   location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
// //
// //   if (_controller != null) {
// //     _controller!.animateCamera(CameraUpdate.newCameraPosition(
// //         CameraPosition(zoom: 16,
// //             target: LatLng(
// //                 position.latitude, position.longitude))));
// //     customMarkers.clear();
// //
// //     customMarkers.add(Marker(
// //       markerId: MarkerId('myMarker'),
// //
// //
// //
// //       onTap: (){print('Marker Tapped');
// //       },
// //       position: LatLng(  position.latitude, position.longitude),
// //     ));
// //   }
// //   GetAddressFromLatLong(position);
// //   setState(() {});
// //
// // }
// }
