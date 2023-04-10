import 'package:http/http.dart';

void senddata_backend(jsondata) async {
  final Uri url = Uri(
      scheme: "http", host: "172.26.144.101", port: 80, path: 'kvh/reports');
  final Map<String, String> headers = {"Content-Type": "application/json"};
  // htpp section
  print("Sending data");
  Map<String, String> body = jsondata;

  Response r = await post(
    url,
    body: body,
  );
}
