import 'package:http/http.dart';

Future<String> senddata_backend(jsondata, upath) async {
  final Uri url =
      Uri(scheme: "http", host: "172.26.144.101", port: 80, path: upath);
  final Map<String, String> headers = {"Content-Type": "application/json"};
  // htpp section
  print("Sending data");
  Map<String, String> body = jsondata;

  Response r = await post(
    url,
    body: body,
  );
  return r.body.toString();
}
