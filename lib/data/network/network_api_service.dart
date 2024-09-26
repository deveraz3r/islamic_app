import 'dart:convert';
import 'dart:io';
import './../app_exceptions.dart';
import './base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic response;
    try {
      response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return returnResponse(response);
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic response;
    try {
      response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data), //sending data in json format
        headers: {"Content-Type" : "application/json"}  //setting content type to json
      ).timeout(Duration(seconds: 10));

    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return returnResponse(response);
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code ${response.statusCode}");
    }
  }

}
