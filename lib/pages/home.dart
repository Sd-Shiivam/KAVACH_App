import 'dart:convert';

import 'package:app/components/bottomnav.dart';
import 'package:app/pages/block.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'callhistory.dart';
import 'msghistory.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Uri url =
      Uri(scheme: "http", host: "172.26.144.208", port: 80, path: '/');
  final Map<String, String> headers = {"Content-Type": "application/json"};
  final Map<String, String> body = {'name': 'Shivam', 'name2': 'Shivam'};
  // @override
  // void initState() {
  //   _getThingsOnStartup().then((value) {
  //     print("Sending");
  //     http
  //         .post(url,
  //             headers: headers,
  //             body: json.encode(body),
  //             encoding: Encoding.getByName('utf-8'))
  //         .then(
  //           (value) => print("Data recived: ${value.body}"),
  //         );
  //     print("Sended");
  //   });
  //   super.initState();
  // }

  // Future _getThingsOnStartup() async {
  //   await Future.delayed(Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);
    var username = "Shivam";
    var status =
        "Your safety is our priority,\nWe're committed to protecting you.";
    var misscalls = "3 Missed Calls";
    var callhistory = "Call History";
    var suspicious = "3 of 10 Suspicious call\n detected ";
    var message = "Messages";
    var totalmess = "10 unread";
    var suspiciousmess = "3 of 10 Suspicious\n messages detected ";
    var spam = "Spam And\nBlocked";
    var link = "Links and UPI ID's";
    var totalspam = "10 Spam";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 70, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi $username,",
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "$status",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      child: Image.asset("assets/images/app.png"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 1, top: 20, right: 1),
              child: CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: ["Shivam", 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'text $i',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            new GestureDetector(
              onTap: () async {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Callhistory()));
              },
              child: new Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xff53E88B), Color(0xff15BE77)])),
                  child: Stack(children: [
                    Image.asset("assets/images/call.png"),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, right: 45),
                        child: Column(children: [
                          Text(
                            "$callhistory",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, right: 30),
                            child: Text(
                              "$misscalls",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 25),
                            child: Text(
                              "$suspicious",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Msghistory()));
              },
              child: new Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xff53E88B), Color(0xff15BE77)])),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset("assets/images/msg.png",
                              height: 130)),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, right: 60),
                          child: Column(children: [
                            Text(
                              "$message",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, right: 50),
                              child: Text(
                                "$totalmess",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, left: 28),
                              child: Text(
                                "$suspiciousmess",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => block()));
              },
              child: new Container(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 16, top: 10),
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xff53E88B), Color(0xff15BE77)])),
                  child: Stack(
                    children: [
                      Image.asset("assets/images/spam.png"),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(children: [
                          Text(
                            "$spam",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, right: 78, left: 90),
                            child: Text(
                              "$link",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            child: Text(
                              "$totalspam",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: btmnav(),
    );
  }
}
