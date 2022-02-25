import 'package:flutter/material.dart';
//import 'package:promociones/src/models/promociones.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:promociones/widget/Header.dart';
import 'package:provider/provider.dart';

//void main() => runApp(Detail(0));

class Detail extends StatefulWidget {


  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> with AutomaticKeepAliveClientMixin {



   @override
  void initState() {

    AppState appState = Provider.of<AppState>(context, listen: false);
    appState.getPromociones(appState.empresa.id);
    super.initState();

    //print(appState.empresa.id);
  }

  @override
  Widget build(BuildContext context) {

    //AppState appState = Provider.of<AppState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // child: 
          // Text("${appState.promocion.beneficio} ${appState.promocion.id}",),
          child: Stack(
            children: <Widget>[
              HeaderCurvo(),
              SafeArea(
                child: _containerAvatar(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerAvatar() {
    return Column(
      children: <Widget>[
        _returnMenu(),
        _avatar(),
        SizedBox(
          height: 20,
        ),
        _titleWidget(context),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[_descripcion(context)]),
          ),
        ),
      ],
    );
  }

  Widget _titleWidget(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Container(
      width: 200,
      child: Text(
        "${appState.empresa.nombreEmpresa}",
        style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _descripcion(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleIntoDetail('Descripción'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width - 40,
                  child: Text(
                    "${appState.promocion.observaciones}",
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _titleIntoDetail('Bases'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width - 40,
                  child: Text(
                    "${appState.promocion.titulo}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _titleIntoDetail('Descuento'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width - 40,
                  child: Text(
                    "${appState.promocion.beneficio}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _titleIntoDetail('Vigencia'),
                  SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width - 40,
                  child: Text(
                    "${appState.promocion.vigencia}",
                    style: TextStyle(fontWeight: FontWeight.bold), 
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _avatar() {
       AppState appState = Provider.of<AppState>(context);
    String url = "http://10.13.123.54:8080/media/";
    final size = MediaQuery.of(context).size;
    print('height - ${size.height}');
    print('width - ${size.width}');
    print("URL" +"$url${appState.empresa.imagenEmpresa}");
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 0.2),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: appState.empresa.imagenEmpresa == null ? _imagenDescuentos() :  _logoEmpresa(),
    );
  }

  Widget _imagenDescuentos() {
    return Image.asset(
       "assets/descuentos.png" ,
       scale: 4,
    );
  }

  Widget _logoEmpresa() {
    AppState appState = Provider.of<AppState>(context);
    String url = "http://10.13.123.54:8080/media/";
    return Image.network(
       "$url${appState.empresa.imagenEmpresa}" ,
       scale: 4,
    );
  }

  Widget _titleIntoDetail(title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.blue[900], fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _returnMenu() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    final size = MediaQuery.of(context).size;
                    print(size.width);
                  },
                  child: Ink(
                    child: Container(
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ]),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
