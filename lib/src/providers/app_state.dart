
import 'package:flutter/cupertino.dart';
import 'package:promociones/pages/Categories.dart';
import 'package:promociones/src/models/Empresa.dart';
import 'package:promociones/src/models/giros.dart';
import 'package:promociones/src/models/promociones.dart';
import 'package:promociones/src/resource/api_base_helper.dart';
import 'package:promociones/src/util/Strings.dart';


class AppState with ChangeNotifier {

  bool loading = false;

   Giros giro = new Giros();

  List<Giros> giros = [];


  Empresa empresa = new Empresa();

List<Empresa> empresas = [];

Promociones promocion = new Promociones();



Future<List<Giros>> getGiros () async {

  this.loading = true;
    ApiBaseHelper _helper = ApiBaseHelper();
    var url = Strings.baseUrl;
    
    
    final response = await _helper.get('$url/giros/');

   
    List<Giros> listaGiros = new List<Giros>();
    response.forEach(
      (elemnt) => {
        listaGiros.add(Giros.fromJson(elemnt))
      }
    );
     print("Totales ${listaGiros.length}");

    this.giros.addAll(listaGiros);
    this.loading = false;
    notifyListeners();

}





Future<List<Empresa>> getEmpresas (giro) async {

  this.loading = true;
    ApiBaseHelper _helper = ApiBaseHelper();
    var url = Strings.baseUrl;
    
    
    final response = await _helper.get('$url/datosempresa/?categoria=$giro');

   
    List<Empresa> listaEmpresa = new List<Empresa>();
    response.forEach(
      (elemnt) => {
        listaEmpresa.add(Empresa.fromJson(elemnt))
      }
    );
     print("Totales ${listaEmpresa.length}");

    this.empresas.addAll(listaEmpresa);
    this.loading = false;
    notifyListeners();

}



List<Promociones> promociones = [];

Future<List<Promociones>> getPromociones (empresa) async {

  this.loading = true;
    ApiBaseHelper _helper = ApiBaseHelper();
    var url = Strings.baseUrl;
     
    final response = await _helper.get('$url/promociones/?empresa=$empresa');

      print(response);
    this.promociones.clear();
    List<Promociones> listaPromociones = new List<Promociones>();
    response.forEach(
      (elemnt) => {
        listaPromociones.add(Promociones.fromJson(elemnt))
      }
    );
     //print("TotalesPromo ${listaPromociones.length}");
      print("_____________");

    this.promociones.addAll(listaPromociones);
    this.promocion = this.promociones[0];
     print("idPromociones: ${this.empresa.id}");
    this.loading = false;
    notifyListeners();

}

  
}