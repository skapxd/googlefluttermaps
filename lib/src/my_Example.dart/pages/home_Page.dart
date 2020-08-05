import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlefluttermaps/src/my_Example.dart/providers/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String  routName = 'HomePage';

  @override
  Widget build(BuildContext context) {

    MapProvider _mapProvider = Provider.of<MapProvider>(context);

    Widget loadingMap(){
      
        if (_mapProvider.loading) {
          
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CircularProgressIndicator(backgroundColor: Color(0xff536DFE), 
                  valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(200 , 200, 200, 1)),
                ),

                Text('Loading: ${ _mapProvider.loading } \n Position: ${ _mapProvider.location }')
              ],
            ),
          );
        } 

      final CameraPosition initialPosition = CameraPosition(
        target: _mapProvider.location,
        zoom: 15
      );

      return GoogleMap(
        initialCameraPosition: initialPosition,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        compassEnabled: true,
        
      );
    }
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: loadingMap()
      ),
    );
  }
}