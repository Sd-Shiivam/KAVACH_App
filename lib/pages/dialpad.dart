import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/bottomnav.dart';

class dialpad extends StatefulWidget {
  const dialpad({Key? key}) : super(key: key);

  @override
  _dialpadState createState() => _dialpadState();
}

class _dialpadState extends State<dialpad> {
  final TextEditingController dialnumbercontroller =
      new TextEditingController();
  double number_width = 100;
  double number_height = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 70, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.lightBlue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(10, 20),
                            blurRadius: 30,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Container(
                                child: Center(
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage:
                                      AssetImage("assets/images/profile.jpg"),
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            )),
                          ),
                          Column(
                            children: [
                              Text("Calling To Mr......\t\t\t\t",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                              Text("+91-" + dialnumbercontroller.text,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("1");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "1";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("2");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "2";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("3");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "3";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("4");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "4";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("5");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "5";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("6");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "6";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("7");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "7";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "7",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("8");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "8";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "8",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("9");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "9";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "9",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("*");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "*";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "*",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("0");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "0";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        print("#");
                        setState(() {
                          if (dialnumbercontroller.text.length <= 9) {
                            dialnumbercontroller.text += "#";
                          }
                        });
                      },
                      child: Container(
                          width: number_width,
                          height: number_height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(10, 20),
                                blurRadius: 30,
                              )
                            ],
                          ),
                          child: Text(
                            "#",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(253, 253, 253, 1),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: btmnav(),
    );
  }
}
