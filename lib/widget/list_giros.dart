
import 'package:flutter/material.dart';
import 'package:promociones/src/models/giros.dart';
import 'package:promociones/widget/item_home.dart';

class ListaGiro extends StatelessWidget {
  
  final List<Giros> giros;


  const ListaGiro (this.giros);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.giros.length,
      itemBuilder: (BuildContext context, int index) {


        return ItemHome(giros[index]);
     }
    );
  }
}