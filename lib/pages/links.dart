import 'package:app/components/popup.dart';
import 'package:app/components/senddata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:kavach/components/bottomnav.dart';

import '../components/bottomnav.dart';

class link extends StatefulWidget {
  const link({Key? key}) : super(key: key);

  @override
  _linkState createState() => _linkState();
}

class _linkState extends State<link> {
  final TextEditingController searchdata = TextEditingController();
  var result = "";
  Future<String> senddata_bitcoin(jsondata, upath) async {
    final Uri url =
        Uri(scheme: "http", host: "192.168.19.155", port: 80, path: upath);
    final Map<String, String> headers = {"Content-Type": "application/json"};
    // htpp section
    print("Sending data");
    Map<String, String> body = jsondata;

    Response r = await post(
      url,
      body: body,
    );
    if (r.body == "Invalid") {
      return "Invalid";
    } else {
      return "valid";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    "Link verify",
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "Please Enter URL Address",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: TextField(
                    controller: searchdata,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      hintText: 'http://172.26.144.101.....',
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "$result",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 51, 180, 8)),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          var very;
                          var x;
                          very = senddata_bitcoin(
                              {"link": searchdata.text}, 'kvh/bit_verify');
                          x = await very;

                          if (x == 'Invalid') {
                            setState(() {
                              result = "Link is in ban list.";
                            });
                          } else {
                            setState(() {
                              result = "Link is safe to open.";
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue),
                        child: const Text(' Verify')),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: btmnav(),
    );
  }
}
