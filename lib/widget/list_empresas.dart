
import 'package:flutter/material.dart';
import 'package:promociones/src/models/Empresa.dart';
import 'package:promociones/widget/item_empresa.dart';
class ListaEmpresas extends StatelessWidget {
  
  final List<Empresa> empresas;


  const ListaEmpresas (this.empresas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.empresas.length,
      itemBuilder: (BuildContext context, int index) {


        return ItemEmpresa(empresas[index]);
     }
    );
  }
}