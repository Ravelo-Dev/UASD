import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasd_app_final/views/landing_view.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/news_viewmodel.dart';
import 'viewmodels/request_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => SolicitudesViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UASD App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LandingView(), // Pantalla inicial
      ),
    );
  }
}
