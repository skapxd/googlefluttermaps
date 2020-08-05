
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapProvider  with ChangeNotifier {


  Geolocator _geolocator = Geolocator();
  final LocationOptions _locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  StreamSubscription<Position> _subscription;

  suscriptionClose(){

    _subscription?.cancel();
  }

  LatLng _location;

  bool _loading = true;


  MapProvider(){

    this._init();
  }

  _init()  {
    _subscription = _geolocator.getPositionStream( _locationOptions ).listen(
      
      ( Position position) { 

        if ( position != null) {
          
          _location = LatLng(position.latitude, position.longitude);
          _loading = false;
          notifyListeners();

        } 
      },
    );
  }


  get location => _location;

  get loading => _loading;

  set location( LatLng _ ){

    this._location = _;
    notifyListeners();
  }

  set loading( bool _){

    this._loading = _;
    notifyListeners();
  }

}