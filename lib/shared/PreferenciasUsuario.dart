import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get tokenAcceso {
    return _prefs.getString('tokenU') ?? null;
  }

  set tokenAcceso(String value) {
    _prefs.setString('tokenU', value);
  }

  set refreshToken(String value) {
    _prefs.setString('refreshToken', value);
  }

  get refreshToken {
    return _prefs.getString('refreshToken') ?? null;
  }

  set nameAcceso(String value) {
    _prefs.setString('refreshToken', value);
  }

  get nameAcceso {
    return _prefs.getString('refreshToken') ?? null;
  }

  get keyUseApp {
    return _prefs.getBool('keyAcces') ?? false;
  }

  set keyUseApp(bool value) {
    _prefs.setBool('keyAcces', value);
  }
}
