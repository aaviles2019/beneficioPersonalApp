import 'package:flutter/material.dart';
// import 'package:promociones/widget/Header.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username, password;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Stack(
        children: [imagen(context), _loginForms(context)],
      ),
    ));
  }

  Widget _loginForms(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.18,
            ),
          ),
          Container(
            width: size.width * 0.80,
            margin: EdgeInsets.symmetric(vertical: 50.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Beneficios al personal',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.035),
                _crearEmailB(),
                SizedBox(height: size.height * 0.025),
                _crearPassword(),
                SizedBox(height: size.height * 0.025),
                _restartPassword(),
                SizedBox(height: size.height * 0.025),
                _crearBoton(context),
                imagencdmx(context)
              ],
            ),
          ),
          SizedBox(height: size.height * 0.04),
          // Image.asset(
          //   'assets/logo_cdmx.png',
          //   scale: 0.1,
          //   width: 250.0,
          // ),
          // SizedBox(height: size.height * 0.08)
        ],
      ),
    );
  }

  Widget _crearEmailB() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          hintText: 'Coloca tu Email',
          labelText: 'Correo electronico',
          suffixIcon: Icon(Icons.person),
        ),
        onChanged: (valor) => setState(() {
              username = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        hintText: 'Coloca una contraseña',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          password = valor;
        });
      },
    );
  }

  Widget imagen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 125),
      child: Hero(
          tag: 'imageHero',
          child: Image.asset(
            'assets/logo.png',
            scale: 1.00,
            width: size.width * .255,
            height: size.height * .155,
          )),
    );
  }

  Widget imagencdmx(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/cdmx-ssc.png',
        scale: 1.00,
        width: size.width * .750,
        height: size.height * .500,
      ),
    );
  }

  Widget _restartPassword() {
    return GestureDetector(
      child: Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(
          color: Colors.blue[900],
        ),
        textAlign: TextAlign.end,
      ),
      onTap: () {
        print('object');
      },
    );
  }

  Widget _crearBoton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FlatButton(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .09, vertical: 16.0),
          child: Text('INICIAR SESIÓN'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Color(0xff054eb1),
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'Home');
          print('Hola mundo');
          print('presion');
        });
  }
}
