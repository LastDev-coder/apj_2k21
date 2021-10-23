import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maa_annapurna_jewllers/Colors/color.dart';
import 'package:maa_annapurna_jewllers/home.dart';

class splash extends StatefulWidget {
  splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Route route = MaterialPageRoute(builder: (context) => home());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.appbar,
      body: Center(
        child: Container(
          //        color: Colors.red,
          height: 270,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/homeicon.svg',
                height: 200.0,
                width: 200.0,
                allowDrawingOutsideViewBox: true,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "মা অন্নপূর্ণা জুয়েলার্স",
                style: GoogleFonts.hindSiliguri(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
