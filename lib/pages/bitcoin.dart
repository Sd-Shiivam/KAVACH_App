import 'package:app/components/popup.dart';
import 'package:app/components/senddata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:kavach/components/bottomnav.dart';

import '../components/bottomnav.dart';

class bitcoin_verfy extends StatefulWidget {
  const bitcoin_verfy({Key? key}) : super(key: key);

  @override
  _bitcoin_verfyState createState() => _bitcoin_verfyState();
}

class _bitcoin_verfyState extends State<bitcoin_verfy> {
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
                    "Bitcoin Id verify",
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
                  "Please Enter Bitcoin Wallet Address",
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
                      hintText: ' 1GVY5eZvtc5bA6EFEGnpq.....',
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
                              {"walletid": searchdata.text}, 'kvh/bit_verify');
                          x = await very;

                          if (x == 'Invalid') {
                            setState(() {
                              result = "Wallet id is not safe to be used";
                            });
                          } else {
                            setState(() {
                              result = "Wallet id is  safe to be used";
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
