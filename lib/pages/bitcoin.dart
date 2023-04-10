import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:kavach/components/bottomnav.dart';

import '../components/bottomnav.dart';

class bitcoinaddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Dial Pad"),
        ),
      ),
      bottomNavigationBar: btmnav(),
    );
  }
}
