import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:maa_annapurna_jewllers/Colors/color.dart';
import 'package:maa_annapurna_jewllers/home.dart';

class admin extends StatefulWidget {
  admin({Key? key}) : super(key: key);

  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _gcontroller = TextEditingController();
  var _scontroller = TextEditingController();

  late String gold, silver;

  UpdatePrice() async {
    if (formkey.currentState!.validate()) {
      print("$gold $silver");

      CollectionReference users =
          FirebaseFirestore.instance.collection("Admin");

      Future<void> addData() {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('EEE d MMM hh:mm a ').format(now);

        return users.doc("8YQGiAs9DeUuFVD726h0").set({
          'Gold': gold,
          'Silver': silver,
          'updatetime': "$formattedDate"
        }).then((value) {
          _scaffoldKey.currentState!.showSnackBar(
            SnackBar(
              elevation: 4.0,
              content: Text('Processing... '),
              duration: new Duration(seconds: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                textColor: Colors.yellow,
                label: 'OK',
                onPressed: () {},
              ),
            ),
          );
        }).catchError((error) {
          SnackBar(
            elevation: 4.0,
            backgroundColor: Colors.red,
            content: Text('$error'),
            duration: new Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              textColor: Colors.yellow,
              label: 'OK',
              onPressed: () {},
            ),
          );
        }).whenComplete(() {
          _scaffoldKey.currentState!.showSnackBar(
            SnackBar(
              elevation: 4.0,
              backgroundColor: Colors.green,
              content: Text('Price Successfully updated'),
              duration: new Duration(seconds: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      }

      await addData();
      _gcontroller.clear();
      _scontroller.clear();
    }
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => home()),
    );
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                              padding:
                                  const EdgeInsets.only(left: 30, right: 10),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SvgPicture.asset(
                              'assets/images/homeicon.svg',
                              height: 150.0,
                              width: 150.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: color.admintxtbg,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Admin Portal",
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 180, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.support,
                                  size: 25,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Price Portal",
                                  style: GoogleFonts.nunito(
                                      color: Colors.black12,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              // obscureText: true,
                              controller: _gcontroller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: color.goldcard),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                labelText: 'Gold Price Per Gram',
                                labelStyle: TextStyle(color: color.goldcard),
                                hintText: '4726',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  gold = value;
                                });
                                print("Gold price" + gold);
                              },
                              validator: (String? value) {
                                if (value!.length < 1) {
                                  return 'you should not make price empty';
                                } else {
                                  gold = value;
                                }
                              },
                              // validator: (String value) {
                              //   if (EmailValidator.validate(value)) {
                              //     email = value;
                              //   } else {
                              //     return "Please enter a valid email";
                              //   }
                              // },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _scontroller,
                              // obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: color.silvercard),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                labelText: 'Silver Price Per Gram',
                                labelStyle: TextStyle(color: color.silvercard),
                                hintText: '63.48',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  silver = value;
                                });
                                print("Silver price" + silver);
                              },
                              validator: (String? value) {
                                if (value!.length < 1) {
                                  return 'you should not make price empty';
                                } else {
                                  silver = value;
                                }
                              },
                              // validator: (String value) {
                              //   if (EmailValidator.validate(value)) {
                              //     email = value;
                              //   } else {
                              //     return "Please enter a valid email";
                              //   }
                              // },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 5, bottom: 5),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                // width: 130,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: color.silvercard),
                                  onPressed: () async {
                                    // launch("tel: $number");
                                    UpdatePrice();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Update Price",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
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
          )),
    );
  }
}
