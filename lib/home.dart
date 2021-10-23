import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maa_annapurna_jewllers/Colors/color.dart';
import 'package:maa_annapurna_jewllers/admin.dart';
import 'package:maa_annapurna_jewllers/password.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final number = "9232560246";
  final userref = FirebaseFirestore.instance.collection('Admin');
  late String goldvalue = "0", silvervalue = "0", dateandtime = "";
  @override
  void initState() {
    GoldData();
    SilverData();
    TimeData();
    super.initState();
  }

  Future GoldData() async {
    FirebaseFirestore.instance
        .collection('Admin')
        .doc('8YQGiAs9DeUuFVD726h0')
        .get()
        .then((DocumentSnapshot) {
      setState(() {
        goldvalue = DocumentSnapshot.data()!['Gold'].toString();
      });
    });
  }

  Future TimeData() async {
    FirebaseFirestore.instance
        .collection('Admin')
        .doc('8YQGiAs9DeUuFVD726h0')
        .get()
        .then((DocumentSnapshot) {
      setState(() {
        dateandtime = DocumentSnapshot.data()!['updatetime'].toString();
      });
    });
  }

  Future SilverData() async {
    FirebaseFirestore.instance
        .collection('Admin')
        .doc('8YQGiAs9DeUuFVD726h0')
        .get()
        .then((DocumentSnapshot) {
      setState(() {
        silvervalue = DocumentSnapshot.data()!['Silver'].toString();
      });
    });
  }

  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit from app ?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => exit(0),
            child: Text('Yes'),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.scaffoldbg,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: color.appbar),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                color: color.appbar,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "মা",
                                style: GoogleFonts.hindSiliguri(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "অন্নপূর্ণা",
                                style: GoogleFonts.hindSiliguri(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                "জুয়েলার্স",
                                style: GoogleFonts.hindSiliguri(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => password()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SvgPicture.asset(
                            'assets/images/homeicon.svg',
                            height: 150.0,
                            width: 150.0,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Card(
                        elevation: 2,
                        color: color.goldcard,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gold Price",
                                        style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Text(
                                          "[ 22k 916 hallmark ]",
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                      'assets/images/gold.svg',
                                      height: 70.0,
                                      width: 70.0,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "₹ $goldvalue",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: 45,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "/ Gram",
                                        style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Last Update : ",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "$dateandtime",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 300,
                      child: Card(
                        elevation: 2,
                        color: color.silvercard,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Silver Price",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SvgPicture.asset(
                                      'assets/images/silver.svg',
                                      height: 70.0,
                                      width: 70.0,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "₹ $silvervalue",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: 45,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "/ Gram",
                                        style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Last Update : ",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "$dateandtime",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 0, top: 10, bottom: 10),
                        child: Container(
                          width: 185,
                          child: Card(
                            elevation: 0,
                            color: color.supportbg,
                            // width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/support.svg',
                                    height: 30.0,
                                    width: 30.0,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                  Text(
                                    "Customer Support",
                                    style: GoogleFonts.nunito(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/location.svg',
                              height: 20.0,
                              width: 20.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Bagnan College Road , Bagnan , Howrah , WestBengal - 711303",
                                style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/call.svg',
                              height: 20.0,
                              width: 20.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "+91 9232560246",
                                style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/whatsapp.svg',
                              height: 20.0,
                              width: 20.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "+91 9232560246",
                                style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  primary: color.calllbg),
                              onPressed: () async {
                                launch("tel: $number");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/callwhite.svg',
                                      height: 15.0,
                                      width: 15.0,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Call Us",
                                        style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
