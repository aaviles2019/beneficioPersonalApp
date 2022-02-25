import 'package:flutter/material.dart';
import 'package:promociones/src/models/giros.dart';
//import 'package:promociones/src/providers/app_state.dart';
//import 'package:provider/provider.dart';

class ItemHome extends StatelessWidget {
  final Giros giro;

  const ItemHome (this.giro);


@override
  Widget build(BuildContext context) {
}
//  @override
//   Widget build(BuildContext context) {
//     final appState= Provider.of<AppState>(context, listen: false);
//      return InkWell(
//         onTap: () {
//           appState.empresas = [];
//           Navigator.pushNamed(context, 'Categories', arguments: { });
//            appState.giro.id;
//         },
//         child: Ink(
//           child: Container(
//                 decoration: BoxDecoration(
//                 color: Colors.blue[900],
//                 borderRadius: BorderRadius.circular(9.0)),
//                 //child: Text('Consulta los descuentos que tenemos para ti'),
//                 child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(
//                     iconos(context),
//                     color: Colors.white,
//                     size: 45.0,
//                   ),
//                 ]),
                
        
//           ),
//         ));
        
//   }

//   IconData iconos(index){
//     switch (index) {
//       case 1:
//         return Icons.directions_bike;
//       break;
//       case 2:
//         return Icons.pool;
      
//       break;
//       case 3:
//         return Icons.add_business;
      
//       break;
//       case 4:
//         return Icons.local_grocery_store;
      
//       break;
//       case 5:
//         return Icons.school;
      
//       break;
//       case 6:
//         return Icons.remove_red_eye;
      
//       break;
//       case 7:
//         return Icons.hotel;
      
//       break;
//       case 8:
//         return Icons.flight;
      
//       break;
//       case 9:
//         return Icons.face_retouching_natural;
      
//       break;
//       case 10:
//         return Icons.local_hospital;
      
//       break;
//       case 11:
//         return null;
      
//       break;
//       default:
//     }
//     return Icons.attractions;
//   }

// @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         child: Container(
//             padding: EdgeInsets.all(20),
//             width: MediaQuery.of(context).size.width,
//             // decoration: BoxDecoration(color: Colors.indigoAccent),
//             child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     child: Stack(
//                       children: <Widget>[
//                         _cardContainer(context),
//                         _imageDescuentos(context),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         "Categoríassssss",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 25,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
                  
//                 ]),
//           ));
    
//   }

//  Widget _cardContainer(BuildContext context) => Container(
//         width: MediaQuery.of(context).size.width,
//         height: 124.0,
//         // margin: EdgeInsets.only(right: 46.0),
//         decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.blue[50],
//             borderRadius: BorderRadius.circular(10.0)),
//         child: Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "¡Hola, buen día..............!",
//                     style: TextStyle(
//                         color: Colors.blue[900],
//                         fontSize: 20,
//                         fontStyle: FontStyle.normal,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     width: 200,
//                     child: Text('Consulta los descuentos que tenemos para ti'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );

//       Widget _imageDescuentos(BuildContext context) => Container(
//         margin: EdgeInsets.symmetric(horizontal: 33.0),
//         alignment: FractionalOffset.centerRight,
//         // padding: EdgeInsets.all(0.0),
//         child: Image(
//           image: AssetImage("assets/descuentos.png"),
//           height: 100.0,
//           width: 92.0,
//         ),
//       );


}