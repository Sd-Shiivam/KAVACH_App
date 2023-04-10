import 'dart:convert';
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_switch/toggle_switch.dart';
import '../components/bottomnav.dart';
import '../components/popup.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 350, top: 29),
                      child: Icon(Icons.arrow_back, size: 35),
                    ),
                  ),
                  Container(
                      child: Center(
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  )),
                  ListTileTheme(
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.only(top: 30, left: 20, bottom: 0),
                      leading: Icon(Icons.label),
                      title: Text(
                        'Shivam Singh',
                        textScaleFactor: 1,
                      ),
                    ),
                    textColor: Color(0xFF4338CA),
                    iconColor: Color(0xFF4338CA),
                  ),
                  ListTileTheme(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(top: 0, left: 20),
                      leading: Icon(Icons.phone),
                      title: Text(
                        '+91-8318737288',
                        textScaleFactor: 1,
                      ),
                    ),
                    textColor: Color(0xFF4338CA),
                    iconColor: Color(0xFF4338CA),
                  ),
                  ListTileTheme(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(top: 0, left: 20),
                      leading: Icon(Icons.mail),
                      title: Text(
                        'Sd.shiivam@gmail.com',
                        textScaleFactor: 1,
                      ),
                    ),
                    textColor: Color(0xFF4338CA),
                    iconColor: Color(0xFF4338CA),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text("Phone Call Protection",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          ToggleSwitch(
                            minWidth: 40.0,
                            minHeight: 30,
                            cornerRadius: 10.0,
                            activeBgColors: [
                              [Color.fromARGB(255, 63, 150, 222)],
                              [Color.fromARGB(255, 100, 101, 101)]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              popupbox(
                                  context,
                                  "",
                                  "Phone Call protection is " +
                                      (index == 0 ? "Enable" : "Disable"));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text("SMS Protection",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          ToggleSwitch(
                            minWidth: 40.0,
                            minHeight: 30,
                            cornerRadius: 10.0,
                            activeBgColors: [
                              [Color.fromARGB(255, 63, 150, 222)],
                              [Color.fromARGB(255, 100, 101, 101)]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              popupbox(
                                  context,
                                  "",
                                  "SMS protection is " +
                                      (index == 0 ? "Enable" : "Disable"));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text("Link Protection",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          ToggleSwitch(
                            minWidth: 40.0,
                            minHeight: 30,
                            cornerRadius: 10.0,
                            activeBgColors: [
                              [Color.fromARGB(255, 63, 150, 222)!],
                              [Color.fromARGB(255, 100, 101, 101)!]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              popupbox(
                                  context,
                                  "",
                                  "link protection is " +
                                      (index == 0 ? "Enable" : "Disable"));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text("UPI ID Protection",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          ToggleSwitch(
                            minWidth: 40.0,
                            minHeight: 30,
                            cornerRadius: 10.0,
                            activeBgColors: [
                              [Color.fromARGB(255, 63, 150, 222)!],
                              [Color.fromARGB(255, 100, 101, 101)!]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              popupbox(
                                  context,
                                  "",
                                  "UPI ID protection is " +
                                      (index == 0 ? "Enable" : "Disable"));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text("Privacy And Policy",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 70),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 75,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 20),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text("About Us",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
