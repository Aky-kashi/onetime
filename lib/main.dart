import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onetime/screens/home/home_screen.dart';
import 'package:onetime/screens/login/login_screen.dart';
import 'package:onetime/screens/tab/tab_screen.dart';
import 'package:onetime/view_models/login_view_model_google.dart';
import 'package:provider/provider.dart';
import 'di/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    return MaterialApp(
      title: "OneTime",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: FutureBuilder(
        future: loginViewModel.isSingIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return TabScreen();
          // if (snapshot.hasData && snapshot.data) {
          //   return HomeScreen();
          // } else {
          //   return LoginScreen();
          // }
        },
      ),
    );
  }
}
