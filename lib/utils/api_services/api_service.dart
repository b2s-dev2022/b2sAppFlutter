import 'dart:convert';
import 'dart:io';
import 'package:b2s/utils/app_const/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ApiService {
  final String _url = AppUrls.apiBaseUrl;

  getData(apiUrl, data) async {
    // print('data: $data');
    bool trustSelfSigned = true;
    var fullUrl = _url + apiUrl;
    HttpClient httpClient = HttpClient();
      // ..badCertificateCallback = ((X509Certificate cert, String host, int port) => trustSelfSigned);

    IOClient ioClient = IOClient(httpClient);
    http.Response response = await ioClient.post(Uri.parse(fullUrl),
      headers: {
        'Content-type': 'application/json'
      },
      body: jsonEncode(data)
    );
    print("ResponseRequest: ${response.request}");
    return response;
  }

  // Future getApi(String url) async {
  //   print(url);
  //   dynamic responseJson;
  //   try {
  //     final response = await http.get(Uri.parse(url)).timeout(
  //           const Duration(seconds: 10),
  //         );
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw InternetException('');
  //   } on ReqTimeOutException {
  //     throw ReqTimeOutException();
  //   }
  //   return responseJson;
  // }
  //
  // Future<dynamic> postApi(var data, String url) async {
  //   print(data);
  //   print(url);
  //
  //   dynamic responseJson;
  //   try {
  //     final response = await http.post(
  //           Uri.parse(url),
  //           body: data,
  //         ).timeout(const Duration(seconds: 10),
  //     );
  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw InternetException('');
  //   } on ReqTimeOutException {
  //     throw ReqTimeOutException();
  //   }
  //   print(responseJson);
  //   return responseJson;
  // }
  //
  // dynamic returnResponse(http.Response res) {
  //   print(res.body.toString());
  //   switch (res.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(res.body);
  //       return responseJson;
  //     case 400:
  //       dynamic responseJson = jsonDecode(res.body);
  //       return responseJson;
  //     default:
  //       throw FetchDatException(
  //           'Error occur while communicating with server ${res.statusCode.toString()}');
  //   }
  // }
}
