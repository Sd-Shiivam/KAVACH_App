import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/bottomnav.dart';

class Searchdata extends StatefulWidget {
  const Searchdata({Key? key}) : super(key: key);

  @override
  _SearchdataState createState() => _SearchdataState();
}

class _SearchdataState extends State<Searchdata> {
  final TextEditingController searchboxtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var call = "Calls";
    var message = "Messages";
    var email = "Emails";
    var bitcoin = "bitcoin";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  "Search",
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: TextField(
                        controller: searchboxtext,
                        onChanged: (value) {
                          print(searchboxtext.text);
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: 'Search',
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 15, left: 10),
                      child: TextButton(
                        onPressed: () {
                          print(searchboxtext.text);
                        },
                        child: Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    )),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 230, top: 40, bottom: 30),
              child: Text(
                "All Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 190),
                                  child: Icon(
                                    Icons.call,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                  "$call",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 190),
                                  child: Icon(
                                    Icons.message,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                  "$message",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 190),
                                  child: Icon(
                                    Icons.email,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                  "$email",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 190),
                                  child: Icon(
                                    Icons.currency_bitcoin,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                  "$bitcoin",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 190),
                                  child: Icon(
                                    Icons.link,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                  "URL's",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 190),
                                  child: Icon(
                                    Icons.block,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                  "block",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: btmnav(),
    );
  }
}
