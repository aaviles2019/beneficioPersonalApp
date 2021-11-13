import 'package:flutter/material.dart';



class CategoriesPage extends StatefulWidget {

  final int idCategory;

  const CategoriesPage({Key key, this.idCategory}) : super(key: key);


  @override
  
  _CategoriesPageState createState() => _CategoriesPageState();
}


class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${widget.idCategory}"),
    );
  }
}