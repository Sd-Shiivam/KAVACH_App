import 'dart:convert';

import 'package:app/components/bottomnav.dart';
import 'package:app/pages/block.dart';
import 'package:call_log/call_log.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sms/sms.dart';

import 'callhistory.dart';
import 'msghistory.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SmsQuery query = new SmsQuery();
  final Uri url =
      Uri(scheme: "http", host: "172.26.144.101", port: 80, path: '/');
  final Map<String, String> headers = {"Content-Type": "application/json"};
  var body = json.encode({'name': 'Shivam', 'name2': 'Shivam'});
  var no_of_calllog = 0;
  var no_of_msglog = 0;
  @override
  void initState() {
    _totalnumbers().then((value) async {
      final Iterable<CallLogEntry> result = await CallLog.query();
      List<SmsMessage> messages = await query.getAllSms;
      setState(() {
        no_of_calllog = result.length;
        no_of_msglog = messages.length;
      });
      // // htpp section
      // print("Sending data");
      // Map<String, String> body = {
      //   'name': 'shivam',
      // };

      // Response r = await post(
      //   url,
      //   body: body,
      // );
      // // htpp section
    });
    super.initState();
  }

  Future _totalnumbers() async {
    await Future.delayed(Duration(seconds: 0));
  }

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
    var suspicious = "3 of $no_of_calllog Suspicious call\ndetected ";
    var message = "Messages";
    var totalmess = "10 unread";
    var suspiciousmess = "3 of $no_of_msglog Suspicious\nmessages detected ";
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
