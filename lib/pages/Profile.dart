import 'dart:convert';
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_switch/toggle_switch.dart';
import '../components/bottomnav.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var call_protected = 1;
  var sms_protected = 0;
  var link_protected = 0;
  var upi_id_protected = 1;
  popupbox(BuildContext context, title, data, type) {
    // set up the buttons
    Widget cancleButton = TextButton(
      child: Text("cancle"),
      onPressed: () {
        if (type == 1) {
          setState(() {
            if (call_protected == 0) {
              call_protected = 1;
            } else {
              call_protected = 0;
            }
          });
        } else if (type == 2) {
          setState(() {
            if (sms_protected == 0) {
              sms_protected = 1;
            } else {
              sms_protected = 0;
            }
          });
        } else if (type == 3) {
          setState(() {
            if (link_protected == 0) {
              link_protected = 1;
            } else {
              link_protected = 0;
            }
          });
        } else if (type == 4) {
          setState(() {
            if (upi_id_protected == 0) {
              upi_id_protected = 1;
            } else {
              upi_id_protected = 0;
            }
          });
        }
        Navigator.pop(context);
      },
    );
    Widget conformButton = TextButton(
      child: Text("Conform"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(data),
      actions: [cancleButton, conformButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                            initialLabelIndex: call_protected,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              setState(() {
                                if (call_protected == 0) {
                                  call_protected = 1;
                                } else {
                                  call_protected = 0;
                                }
                              });
                              popupbox(
                                  context,
                                  "",
                                  "Phone Call protection is " +
                                      (index == 0 ? "Enable" : "Disable"),
                                  1);
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
                            initialLabelIndex: sms_protected,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              setState(() {
                                sms_protected == 0
                                    ? sms_protected = 1
                                    : sms_protected = 0;
                              });
                              popupbox(
                                  context,
                                  "",
                                  "SMS protection is " +
                                      (index == 0 ? "Enable" : "Disable"),
                                  2);
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
                            initialLabelIndex: link_protected,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              setState(() {
                                link_protected == 0
                                    ? link_protected = 1
                                    : link_protected = 0;
                              });
                              popupbox(
                                  context,
                                  "",
                                  "link protection is " +
                                      (index == 0 ? "Enable" : "Disable"),
                                  3);
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
                            initialLabelIndex: upi_id_protected,
                            totalSwitches: 2,
                            labels: ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              setState(() {
                                upi_id_protected == 0
                                    ? upi_id_protected = 1
                                    : upi_id_protected = 0;
                              });
                              popupbox(
                                  context,
                                  "",
                                  "UPI ID protection is " +
                                      (index == 0 ? "Enable" : "Disable"),
                                  4);
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
