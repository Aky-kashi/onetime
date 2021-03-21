import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverPod;
import 'package:onetime/screens/home/home_screen.dart';
import 'package:onetime/screens/login/login_screen.dart';
import 'package:onetime/screens/tab/tab_screen.dart';
import 'package:onetime/view_models/login_view_model_google.dart';
import 'package:provider/provider.dart';

import 'di/providers.dart';
import 'di/state_notifier/theme_controller.dart';
import 'models/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    riverPod.ProviderScope(
      child: MultiProvider(
        providers: globalProviders,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    final themeMode = riverPod.useProvider(themeSelectorProvider.state);
    return MaterialApp(
      title: "OneTime",
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark ? darkThemeData : lightThemeData,
      darkTheme: themeMode == ThemeMode.light ? lightThemeData : darkThemeData,
      home: FutureBuilder(
        future: loginViewModel.isSingIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          //return TabScreen();
          if (snapshot.hasData && snapshot.data) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
