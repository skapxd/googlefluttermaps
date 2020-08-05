import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:googlefluttermaps/src/my_Example.dart/pages/home_Page.dart';
import 'package:googlefluttermaps/src/my_Example.dart/pages/request_Permission_Page.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin{
  
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async{ 
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    if(hasAccess){
      Navigator.pushReplacementNamed(context, HomePage.routName);
    }else{
      Navigator.pushReplacementNamed(context, RequestPermissionPage.routName);
    }
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }

}