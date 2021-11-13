

import 'package:promociones/src/models/Empresa.dart';
import 'package:promociones/src/models/giros.dart';
import 'package:promociones/src/util/Strings.dart';
import 'api_base_helper.dart';

class NetworkUtil {

   static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Future<List<Giros>> getGiros () async {
    ApiBaseHelper _helper = ApiBaseHelper();
    var url = Strings.baseUrl;
    
    
    final response = await _helper.get('$url/giros/');

    List<Giros> listaGiros = new List<Giros>();
    response.forEach(
      (elemnt) => {
        listaGiros.add(Giros.fromJson(elemnt))
      }
    );
    return listaGiros;
  }

  //   Future<List<Empresa>> getEmpresa (giro) async {
  //   ApiBaseHelper _helper = ApiBaseHelper();
  //   var url = Strings.baseUrl;
    
    
  //   final response = await _helper.get('$url/datosempresa/?categoria=$giro');

  //   print(response);

  //   List<Empresa> listaEmpresa = new List<Empresa>();
  //   response.forEach(
  //     (elemnt) => {
  //       listaEmpresa.add(Empresa.fromJson(elemnt))
  //     }
  //   );

    

  //   return listaEmpresa;
  // }

}
// Future<Empresa> getEmpresa(giro_id) async {
//     ApiBaseHelper _helper = ApiBaseHelper();
//     var url = Strings.baseUrl;

//     final uri = '$url/datosempresa/?categoria=$giro_id';
//       print('empresa');

//      final response = await _helper.get(uri { empresa});
  
//     return Empresa.fromJson(response);
//   }

  // Future<Giros> getGiros () async {
  //   ApiBaseHelper _helper = ApiBaseHelper();
  //   var url = Strings.baseUrl;

  //   final response = await _helper.get('$url/giros/');
  //   return List<Giros>;
  // }



  
  /*final Dio _dio = Dio();
  final _baseUrl = 'http://127.0.0.1:8000/api/v1';

  /*Future<Empresa>getEmpresa() async {
    Response userData = await _dio.get(_baseUrl+ '/promociones/empresa_id');
    print('empresa: $userData.data');
    Empresa empresa = Empresa.fromJson(userData.data);

    return empresa;
  }*/
  Future<Empresa> getEmpresa() async {
    Empresa empresa;
    try {
      Response userData = await _dio.get(_baseUrl + '/promociones/?empresa_id=1');
      print('User Info: ${userData.data}');
      empresa = Empresa.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return empresa;
  
    }*/
  
  
