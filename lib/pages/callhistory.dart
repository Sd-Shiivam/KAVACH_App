import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

import '../components/bottomnav.dart';

class Callhistory extends StatefulWidget {
  const Callhistory({Key? key}) : super(key: key);

  @override
  _CallhistoryState createState() => _CallhistoryState();
}

class _CallhistoryState extends State<Callhistory> {
  TextStyle mono = TextStyle(fontFamily: 'monospace');
  final List<Widget> data = <Widget>[];
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  @override
  void initState() {
    _callhistorycollector().then((value) async {
      print("Getting Call log");
      final Iterable<CallLogEntry> result = await CallLog.query();
      setState(() {
        List data = [];
        _callLogEntries = result;
      });
    });
    super.initState();
  }

  Future _callhistorycollector() async {
    await Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    for (CallLogEntry entry in _callLogEntries) {
      data.add(
        Container(
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/call_history.png"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  children: [
                    Text("${entry.number}"),
                    Text("${entry.callType.toString().split('.')[1]}")
                  ],
                ),
              )
            ],
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), //border corner radius
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
              //you can set more BoxShadow() here
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              child: Center(
                child: Text(
                  "Calls",
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            Column(
              children: data,
            )
          ],
        ),
      )),
      bottomNavigationBar: btmnav(),
    );
  }
}
