import 'dart:io';

import 'package:dio/dio.dart';

import 'app_exceptions.dart';

class NetworkApiServices {
  Future getList() async {
    Dio dio = Dio();

    var limit = 15;
    String graphQuery = '''{
  pokemons(first:$limit) {
    id
    name
    weight {
      minimum
      maximum
    }
    height {
      minimum
      maximum
    }
    classification
    image
  } 
}
  ''';
    final query = {'query': graphQuery.toString()};
    try {
      Response response =
          await dio.post("https://graphql-pokemon2.vercel.app", data: query);
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }


  Future getDetails(String id, String name) async {
    Dio dio = Dio();
    String graphQuery = '''{
  pokemon(id:\"$id\",name:\"$name\"){
    id
    name
    weight {
      minimum
      maximum
    }
    height {
      minimum
      maximum
    }
    classification
    image
  }
}
  ''';
    final query = {'query': graphQuery.toString()};
    print("API call failed with status code$query");
    try {
      Response response =
      await dio.post("https://graphql-pokemon2.vercel.app", data: query);
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException('Error occur while communicating with server' +
            'error code' +
            response.statusCode.toString());
    }
  }
}
