import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottomnav.dart';

class link extends StatelessWidget {
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
