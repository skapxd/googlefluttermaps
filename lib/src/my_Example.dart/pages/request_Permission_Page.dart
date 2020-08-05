import 'package:flutter/material.dart';
import 'package:googlefluttermaps/src/my_Example.dart/pages/home_Page.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  static const routName = 'RequestPermissionPage';
  @override
  _RequestPermissionPageState createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> with WidgetsBindingObserver{
  
  @override
  void initState() { 
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() { 
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) { 
    print('AppLifecycleState :::::::::::::: $state');

    if (state == AppLifecycleState.resumed) {
      this._check();
    }
  }

  _check() async{
    print('AppLifecycleState :::::::::::::: cheking');
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    if(hasAccess){
      this._goToHome();
    }
  }

  _goToHome(){
    Navigator.pushReplacementNamed(context, HomePage.routName);
  }


  Future<void> _request() async{
    final PermissionStatus status = 
      await Permission.locationWhenInUse.request();

      print('satatus: $status');

      switch (status){
        
        case PermissionStatus.undetermined:
          
          break;
        case PermissionStatus.granted:
          // this._goToHome(); 
          
          break;
        case PermissionStatus.denied:
          
          break;
        case PermissionStatus.restricted:
          
          break;
        case PermissionStatus.permanentlyDenied:
          openAppSettings(); 
          break;
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(  
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PERMISO REQUERIDO', style: TextStyle(fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Amet anim veniam id duis id excepteur. Et non et officia commodo dolore consectetur officia et anim ullamco. Exercitation non ex veniam eu fugiat aliquip minim enim. Sunt nulla veniam qui tempor. Dolor amet reprehenderit commodo aute excepteur. Et ullamco dolor ipsum esse amet ipsum cillum eiusmod do qui ullamco velit occaecat tempor. Quis officia amet aliquip exercitation.',
                style: TextStyle(
                  fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: this._request,
              child: Text('Permitir', style: TextStyle(color: Colors.white),)
            )

          ],
        ),
      )
    );
  }
}