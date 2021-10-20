import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wedevs_assignment/utils/app_constant.dart';
import 'dart:io';
import 'dart:async';
import 'custom_exception.dart';

class APIManager {
  static Future<dynamic> postAPICall({required String url, Map<String, String>? body, Map<String, String>? header}) async {
    var responseJson;
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode(body);
      request.headers.addAll(header!);
      http.StreamedResponse res = await request.send();
      var response = await http.Response.fromStream(res).timeout(Duration(minutes: 1));
      print("URL:: $url");
      print("BODY:: $body");
      print("RESPONSE:: ${response.body}");
      print("STATUS CODE:: ${response.statusCode}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> getAPICall({required String url, Map<String, String>? header}) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: header).timeout(Duration(seconds: 30));
      print("URL:: $url");
      print("Method:: GET");
      print("RESPONSE:: ${response.body}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }
}

dynamic _response(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body.toString();
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
      throw InternalServerError(response.body.toString());
    default:
      throw FetchDataException('Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
  }
}

void apiErrorMessage(String msg) {
  if (msg == "Time Out: null") {
    errorSnackbar("Network time out");
  } else if (msg == "Error_no_internet") {
    errorSnackbar("Check your internet connection");
  } else {
    errorSnackbar('$msg');
  }
}
