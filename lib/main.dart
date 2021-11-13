import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:promociones/pages/Categories.dart';
import 'package:promociones/pages/Detail.dart';
import 'package:promociones/pages/HomePage.dart';
import 'package:promociones/shared/PreferenciasUsuario.dart';

import 'package:flutter/cupertino.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =
      new PreferenciasUsuario(); //obtener en todo mi aplicacion las preferencias del usuario
  await prefs.initPrefs();
  runApp(Phoenix(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState())
      ],
      child: MyApp(),
    ),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promociones SSC',
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'Home':
            return CupertinoPageRoute(
                builder: (_) => HomePage(), settings: settings);
          case 'Categories':
            return CupertinoPageRoute(
                builder: (_) => Categories(0), settings: settings);
          case 'Detail':
            return CupertinoPageRoute(
                builder: (_) => Detail(), settings: settings);

        }
      },
      home: HomePage(),
    );
  }
}
