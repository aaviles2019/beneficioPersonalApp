import 'package:flutter/material.dart';
import 'package:promociones/widget/Header.dart';

class DescribePage extends StatefulWidget {
  @override
  _DescribePageState createState() => _DescribePageState();
}

class _DescribePageState extends State<DescribePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Stack(
        children: [HeaderWave()],
      ),
    ));
  }
}
