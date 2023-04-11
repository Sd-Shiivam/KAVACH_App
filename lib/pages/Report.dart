import 'dart:convert';

import 'package:app/components/senddata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../components/bottomnav.dart';

popupbox(BuildContext context, title, data) {
  // set up the buttons
  Widget okButton = TextButton(
    child: Text("Ok"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(data),
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController topicController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Number';

  // List of items in our dropdown menu
  var items = ['Number', 'SMS', 'UPI ID', 'Links', 'Bitcoin Address'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  "Generate a Report",
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
                "Please Select Category",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 40,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownvalue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 30, left: 30),
              child: Text(
                "Please Enter ${dropdownvalue}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                child: TextField(
                  controller: topicController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    hintText: '$dropdownvalue Detail',
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 30, left: 30),
              child: Text(
                "Please enter your Remarks",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: TextField(
                  controller: remarksController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    hintText: 'Enter your remarks',
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: ElevatedButton(
                      onPressed: () => {
                            senddata_backend({
                              'category': dropdownvalue,
                              'detail': topicController.text,
                              'remarks': remarksController.text
                            }, 'kvh/reports'),
                            popupbox(context, "", "Report Submited"),
                            topicController.clear(),
                            remarksController.clear()
                          },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                      child: const Text(' Submit')),
                ))
          ],
        ),
      ),
      bottomNavigationBar: btmnav(),
    );
  }
}
