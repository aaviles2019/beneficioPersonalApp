import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:promociones/src/models/giros.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:promociones/src/resource/network_util.dart';
import 'package:provider/provider.dart';
// import 'package:promociones/widget/Header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final NetworkUtil _util = new NetworkUtil();
  List<Giros> listaGiros = [];
  @override
  void initState() {
    super.initState();
    fetchCategorias();
  }

  void fetchCategorias() async {
    listaGiros = await _util.getGiros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(color: Colors.indigoAccent),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        _cardContainer(context),
                        _imageDescuentos(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Text(
                        "Categorías",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _newButtonsRow(context),
                ]),
          ),
        )
      ],
    ));
  }

  Widget _imageDescuentos(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 33.0),
        alignment: FractionalOffset.centerRight,
        // padding: EdgeInsets.all(0.0),
        child: Image(
          image: AssetImage("assets/descuentos.png"),
          height: 100.0,
          width: 92.0,
        ),
      );

  Widget _cardContainer(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 124.0,
        // margin: EdgeInsets.only(right: 46.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "¡Hola, buen día!",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    child: Text('Consulta los descuentos que tenemos para ti'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // Widget _newButtonsRow() => Expanded(
  //       // color: Colors.black,
  //       child: GridView(
  //         // physics: FixedExtentScrollPhysics(),
  //         padding: EdgeInsets.only(top: 5, right: 5, left: 5),
  //         scrollDirection: Axis.vertical,
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 15,
  //             crossAxisSpacing: 15,
  //             childAspectRatio: 1.40),
  //         children: _rowsButtons(),
  //       ),
  //     );

  Widget _newButtonsRow(context) => Expanded(
        // color: Colors.black,
        child: GridView.builder(
          // physics: FixedExtentScrollPhysics(),
          padding: EdgeInsets.only(top: 5, right: 5, left: 5),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.40),
          itemCount: listaGiros.length,
          itemBuilder: (context, index) {
            return _buttonWidget(listaGiros[index].descripcion,listaGiros[index].id, index, );
          },
        ),
      );

  // List<Widget> _rowsButtons() {
  //   List<Widget> myButtons = [];
  //   List<Map<String, dynamic>> titlesButtons = [
  //     {'title': 'Parques', 'icon': Icons.park, 'route': 'ParquesCategories'},
  //     {
  //       'title': 'Hoteles',
  //       'icon': Icons.apartment_rounded,
  //       'route': 'HotelesCategories'
  //     },
  //     {
  //       'title': 'Viajes',
  //       'icon': Icons.airplanemode_on,
  //       'route': 'ViajesCategories'
  //     },
  //     {
  //       'title': 'Restaurantes',
  //       'icon': Icons.restaurant,
  //       'route': 'RestaurantesCategories'
  //     },
  //     {
  //       'title': 'Óptica',
  //       'icon': Icons.remove_red_eye,
  //       'route': 'OpticaCategories'
  //     },
  //     {
  //       'title': 'Servicios Médicos',
  //       'icon': Icons.control_point_sharp,
  //       'route': 'ServiciosCategories'
  //     },
  //     {
  //       'title': 'Tiendas',
  //       'icon': Icons.shopping_bag_rounded,
  //       'route': 'TiendasCategories'
  //     },
  //     {
  //       'title': 'Estudios',
  //       'icon': Icons.report_gmailerrorred_sharp,
  //       'route': 'EstudiosCategories'
  //     },
  //   ];

  //   for (var i = 0; i < titlesButtons.length; i++) {
  //     // String title = titleButtons[i];
  //     myButtons.add(_buttonWidget(titlesButtons[i]['title'],
  //         titlesButtons[i]['icon'], route: titlesButtons[i]['route']));
  //   }
  //   return myButtons;
  // }

  Widget _buttonWidget(title, int id, int index) {
    final appState= Provider.of<AppState>(context, listen: false);
    return InkWell(
        onTap: () {
          appState.empresas = [];
          Navigator.pushNamed(context, 'Categories', arguments: { id: id});
          appState.giro.id = id;
        },
        child: Ink(
          child: Container(
            // width: 135,
            // height: 100,
            decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(9.0)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    iconos(index),
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  )
                ]),
          ),
        ));
  }

  IconData iconos(index){
    switch (index) {
      case 1:
        return Icons.directions_bike;
      break;
      case 2:
        return Icons.pool;
      
      break;
      case 3:
        return Icons.add_business;
      
      break;
      case 4:
        return Icons.local_grocery_store;
      
      break;
      case 5:
        return Icons.school;
      
      break;
      case 6:
        return Icons.remove_red_eye;
      
      break;
      case 7:
        return Icons.hotel;
      
      break;
      case 8:
        return Icons.flight;
      
      break;
      case 9:
        return Icons.face_retouching_natural;
      
      break;
      case 10:
        return Icons.local_hospital;
      
      break;
      case 11:
        return null;
      
      break;
      default:
    }
    return Icons.attractions;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
