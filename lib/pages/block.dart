import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottomnav.dart';

class block extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 90),
        height: 150.0,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              child: Center(
                child: Text(
                  "Messages",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 160.0,
              child: Center(
                child: Text(
                  "Calls",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 160.0,
              child: Center(
                child: Text(
                  "Websites",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 160.0,
              child: Center(
                child: Text(
                  "UPI ID's",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
