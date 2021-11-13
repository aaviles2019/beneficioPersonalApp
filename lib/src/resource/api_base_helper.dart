import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:app_armeros/util/app_exception.dart';
// import 'package:app_armeros/util/strings.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:promociones/src/util/app_exception.dart';
// import 'package:iph/src/util/AppException.dart';
// import 'package:iph/src/util/Strings.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return responseJson;
  }

  Future<dynamic> getWithToken(String url, String token) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'JWT $token',
        'Content-Type': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return responseJson;
  }

  Future<dynamic> getWithTokenParams(
      String url, String token, Map<String, dynamic> queryParameters) async {
    print('Api Get, url $url');
    Dio dio = new Dio();
    Map<String, String> headers = {
      'Authorization': 'JWT $token',
      'Content-Type': 'application/json',
    };
    var responseJson;
    try {
      final response = await dio
          .get(url,
              queryParameters: queryParameters,
              options: Options(headers: headers))
          .timeout(const Duration(seconds: 10));
      responseJson = response.data;
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url, Map<String, String> headers) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(url, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      // print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return responseJson;
  }

  Future<dynamic> postWithHeader(String url, String token, String body) async {
    Dio dio = new Dio();
    print('Api POST, url $url');
    var responseJson;
    Map<String, String> headers = {
      'Authorization': 'JWT $token',
      'Content-Type': 'application/json',
    };
    try {
      final response = await dio
          .post(url, data: body, options: Options(headers: headers))
          .timeout(const Duration(seconds: 10));
      responseJson = response.data;
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, String token) async {
    // print('Api Post, url $url body $body');
    var responseJson;
    try {
      final response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          token != null ? 'Authorization' : 'Bearer $token': ''
        },
      ).timeout(const Duration(seconds: 5));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    // print('api post.');
    return responseJson;
  }

  Future<dynamic> login(String url, String body) async {
    print('Api Post, url $url body $body');
    var responseJson;
    try {
      final response = await http.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 30));
      responseJson = _returnResponse(response);
    } on SocketException {
      // print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    // print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    // print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      // print('No net');
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    // print('api put.');
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await http.delete(url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(
          'Hay un problema al acceder a la red. Verifica tu conexión o vuelve a intentarlo en unos minutos.');
    }
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      return responseJson;
    case 201:
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 404:
      throw EmpleadoqrException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Se produjo un error al comunicarse con el servidor con StatusCode : ${response.statusCode}');
  }
}
