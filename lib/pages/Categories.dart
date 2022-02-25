import 'package:flutter/material.dart';
import 'package:promociones/src/models/Empresa.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:promociones/src/resource/network_util.dart';
import 'package:promociones/widget/Header.dart';
import 'package:promociones/widget/list_empresas.dart';
import 'package:provider/provider.dart';

//void main() => runApp(Categories());

class Categories extends StatefulWidget {

  final idCategory;

  const Categories( this.idCategory);
  


  @override
  _CategoriesState createState() => _CategoriesState();


}

class _CategoriesState extends State<Categories> with AutomaticKeepAliveClientMixin{

  final NetworkUtil _util = new NetworkUtil();
  List<Empresa> listaEmpresa = [];
  @override
  void initState() {

    AppState appState = Provider.of<AppState>(context, listen: false);
    appState.getEmpresas(appState.giro.id);
    super.initState();
    print(appState.giro);
    
   // print("idCategoria: ${widget.idCategory}");
    //fetchCategorias(widget.idCategory);
  }

  // void fetchCategorias(id) async {
     
  //   listaEmpresa = await _util.getEmpresa(id);
  // }

  

  @override

  Widget build(BuildContext context) {

    Provider.of<AppState>(context, listen: false).empresas = listaEmpresa;
    return Scaffold(
  
        backgroundColor: Colors.white,
        body: Stack(
            children: <Widget>[
            HeaderCurvo(),
          SafeArea(child: _containerAvatar()),
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.only(top: 170),
            child: listaEmpresa.length > 0 ?   lista(context): _validarEmpresas()
            //child:  lista(context),
          ),         // Expanded(
          //             child: Positioned(
          //     child: lista(context),
          //     top: 21,
          //     right: 21,
          //     left: 21,
          //   ),
          // ),
             
            ],
        ),
      );
    
  }
  
  Widget _validarEmpresas() {
    
    return AlertDialog(
       content: Text('¡Por el momento no contamos con establecimientos!',
        style: TextStyle(color: Colors.blue[900], fontSize: 17, fontWeight: FontWeight.bold )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
        );
    
  }



Widget _containerAvatar() {
    return Column(
      children: <Widget>[
        _returnMenu(),
        //_avatar(),
        SizedBox(
          height: 2,
        ),
        _titleWidget(context),
        // Expanded(
        //   child: SingleChildScrollView(
        //     child: Column(children: <Widget>[_descripcion(context)]),
        //   ),
        // ),
      ],
    );
  }
   Widget _titleWidget(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    
    return Container(
      width: 160,
      child: Text(
        "${appState.giro.descripcion}",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
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
   Widget _avatar() {
    final size = MediaQuery.of(context).size;
    print('height - ${size.height}');
    print('width - ${size.width}');
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 0.2),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Image.asset(
        "assets/descuentos.png",
        scale: 4,
      ),
    );
  }
  
  Widget lista(BuildContext context) {

    AppState appState = Provider.of<AppState>(context);
        //fetchCategorias(appState.giro.id);
    return ListaEmpresas( appState.empresas );

  }

  // return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Categories',
  //     home: Scaffold(
  //         body: Stack(
  //       children: <Widget>[
  //         SafeArea(
  //           child: Container(
  //             padding: EdgeInsets.all(20),
  //             child: Column(
  //               children: <Widget>[
  //                 Row(
  //                   children: <Widget>[
  //                     InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                           // Navigator.pushNamed(context, '$route', arguments: {});
  //                         },
  //                         child: Ink(
  //                           child: Container(
  //                             child: Column(children: <Widget>[
  //                               Icon(
  //                                 Icons.arrow_back_ios_rounded,
  //                                 color: Colors.black,
  //                                 size: 26,
  //                               ),
  //                             ]),
  //                           ),
  //                         )),
  //                   ],
  //                 ),
  //                 SizedBox(height: 30),
  //                 Row(
  //                   children: <Widget>[
  //                     Text(
  //                       "Parques2",
  //                       style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 25,
  //                           fontStyle: FontStyle.normal,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 Expanded(
  //                   child: SingleChildScrollView(
  //                     child: Column(
  //                       children: [
  //                        ListaEmpresas(appState.empresas)
  //                       ]
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     )),
  //   );
  //}

   @override
  bool get wantKeepAlive => true;

  // List<Widget> _scrollWidgetExample() {


  //   List<Empresa> empresas = Provider.of<AppState>(context).empresas;

    
  //   List<Widget> value = [];
  //   for (var i = 0; i < 2; i++) {
  //     value
  //       ..add(_containerEnterprise())
  //       ..add(SizedBox(
  //         height: 20,
  //       ));
  //   }
  //   return value;
  // }

  
  
}
