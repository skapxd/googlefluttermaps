import 'package:flutter/material.dart';

import 'package:googlefluttermaps/src/my_Example.dart/pages/home_Page.dart';
import 'package:googlefluttermaps/src/my_Example.dart/pages/request_Permission_Page.dart';
import 'package:googlefluttermaps/src/my_Example.dart/pages/splash_Page.dart';
import 'package:googlefluttermaps/src/my_Example.dart/providers/provider.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( builder: (context) => MapProvider())
      ],
      child: MaterialApp(
        title: 'Material App',
        home: SplashPage(),
        routes: {
          HomePage.routName:              (_)=> HomePage(),
          RequestPermissionPage.routName: (_) => RequestPermissionPage()
        },
      ),
    );
  }
}