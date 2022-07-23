
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practice/firebaseData/read_write.dart';

import '../controllers/map_provider/map_provider.dart';
import '../controllers/user_provider/user_provider.dart';
import '../utls/utls.dart';

class FirebaseLocationListen
{

FirebaseLocationListen._privateConstructor();
static final FirebaseLocationListen _locationInstance = FirebaseLocationListen._privateConstructor();

static FirebaseLocationListen get instance => _locationInstance;
  locationListener(var lat, var lng){
    firestore.collection("locationUpdate").doc('hamzamuazzam').snapshots().listen((event) {
      var data = event.data() as Map<String, dynamic>;
      lat = data['lat'];
      lng = data['lng'];
      if(lat==null || lng == null) return ;
      mapProvider.mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng),16.0));
logger.i('this is singlton class');
    });
  }



dispose(){



}

}
