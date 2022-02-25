
import 'package:flutter/material.dart';
import 'package:promociones/src/models/Empresa.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:provider/provider.dart';

class ItemEmpresa extends StatelessWidget {
  final Empresa empresa;

  const ItemEmpresa (this.empresa);

  @override
  Widget build(BuildContext context) {
    var heightCaja = MediaQuery.of(context).size.height - 545;
     return InkWell(
        onTap: () {
          final empresaState = Provider.of<AppState>(context, listen: false);
          empresaState.empresa = empresa;
          Navigator.pushNamed(context, 'Detail');
          print("ID ${empresa.id}");
        },
        child: Ink(
          padding: EdgeInsets.all(7.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: heightCaja,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white10,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _imageEnterprise(context),
                _datos(context),
              ],
            ),
          ),
        ));

        
  }

  // Widget _titleWidget(BuildContext context) {
  //   return Container(
  //     width: 160,
  //     child: Text(
  //       "${empresa.giro}",
  //       style: TextStyle(
  //           fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  Widget _imageEnterprise(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 14.0),
        alignment: FractionalOffset.centerLeft,
        child: Image(
          image: AssetImage("assets/descuentos.png"),
          height: 100.0,
          width: 92.0,
        ),
      );


       Widget _datos(BuildContext context) { 
         var widthCaja = MediaQuery.of(context).size.width - 161;
         return Container(
             child: Row(
          children: <Widget>[
            Container(
              width: widthCaja,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                     "${empresa.nombreEmpresa}",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text("${empresa.calle}  ${empresa.numeroExt}  ${empresa.alcaldia}"),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child: Text("${empresa.telefonoContacto}"),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child: Text("${empresa.emailContacto}"),
                  ),
                ],
                
              ),
            ),
          ],
        ),

      );
}

}

  
