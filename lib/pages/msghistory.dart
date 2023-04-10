import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

import '../components/bottomnav.dart';

class Msghistory extends StatefulWidget {
  const Msghistory({Key? key}) : super(key: key);

  @override
  _MsghistoryState createState() => _MsghistoryState();
}

class _MsghistoryState extends State<Msghistory> {
  TextStyle mono = TextStyle(fontFamily: 'monospace');
  SmsQuery query = new SmsQuery();
  Iterable<SmsMessage> _smshistorylog = <SmsMessage>[];
  final List<Widget> data = <Widget>[];
  @override
  void initState() {
    _callhistorycollector().then((value) async {
      print("Getting SMS log");
      List<SmsMessage> messages = await query.getAllSms;
      print(messages[0].date);
      setState(() {
        List data = [];
        _smshistorylog = messages;
      });
    });
    super.initState();
  }

  Future _callhistorycollector() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    for (SmsMessage entry in _smshistorylog) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${entry.sender}"),
                        Text(
                          "[${entry.date.toString().split(' ')[1]}]",
                        ),
                      ],
                    ),
                    Align(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text("${entry.body.toString()}"),
                    )),
                  ],
                ),
              )
            ],
          ),
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
                  "Messages",
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
