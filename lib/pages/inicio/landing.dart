import 'dart:async';

import 'package:flutter/material.dart';
import 'package:promociones/src/models/giros.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:promociones/src/resource/network_util.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:provider/provider.dart';

class Bienvenida extends StatefulWidget {
  Bienvenida({Key key}) : super(key: key);

  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  AppState appState;
  final NetworkUtil _util = new NetworkUtil();
  List<Giros> listaGiros = [];

  @override
  void initState() {
    super.initState();
    fetchCategorias();
    startSplashScreen();
    timeDilation = 1.98;
  }

  Future validarCategorias() async {
    // listaGiros = Provider.of<AppState>(context, listen: false).giros;

    if (listaGiros.length > 0) {
      Provider.of<AppState>(context, listen: false).giros = listaGiros;
      Navigator.pushReplacementNamed(context, 'Home');
    } else {
      _showDialog("Error", "Peticion fallida");
    }
  }

  void _showDialog(String title, String content, {bool asignado = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () {
                if (asignado)
                  Navigator.pushReplacementNamed(context, '/home');
                else
                  Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      validarCategorias();
    });
  }

  void fetchCategorias() async {
    listaGiros = await _util.getGiros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white,
                    Colors.white,
                  ])),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Container(
                        child: Hero(
                            tag: 'imageHero',
                            child: Image(
                              image: AssetImage('assets/descuentos.png'),
                              width: 150.0,
                              height: 150.0,
                            ))),
                    radius: MediaQuery.of(context).size.height * 0.08,
                  ),
                ),
              ],
            )
          ],
        ),
        resizeToAvoidBottomInset: false);
  }
}
