import 'package:flutter/material.dart';
import 'package:promociones/src/models/giros.dart';
import 'package:promociones/src/providers/app_state.dart';
import 'package:provider/provider.dart';

class ItemHome extends StatelessWidget {
  final Giros giro;

  const ItemHome (this.giro);


//  @override
//   Widget build(BuildContext context) {
//      return InkWell(
//         onTap: () {
//           final giroState = Provider.of<AppState>(context, listen: false);
//           giroState.giro = giro;
//           Navigator.pushNamed(context, 'Detail');
//           print("ID ${giro.id}");
//         },
//         child: Ink(
//           padding: EdgeInsets.all(7.0),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 200,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.black,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                _datos(context),
//               ],
//             ),
//           ),
//         ));

        
//   }

@override
  Widget build(BuildContext context) {
    return InkWell(
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
                  
                ]),
          ));
    
  }

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


}