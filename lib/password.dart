import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maa_annapurna_jewllers/Colors/color.dart';
import 'package:maa_annapurna_jewllers/admin.dart';

class password extends StatefulWidget {
  password({Key? key}) : super(key: key);

  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<password> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _pcontroller = TextEditingController();

  late String password;

  checkAdmin() {
    if (formkey.currentState!.validate()) {
      if (password == "apj@9232560246") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => admin()),
        );
      } else {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            elevation: 4.0,
            backgroundColor: Colors.red,
            content: Text('Please enter correct security pin'),
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "মা",
                                style: GoogleFonts.hindSiliguri(
                                  color: Colors.white,
                                  fontSize: 90,
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
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Security Portal",
                    style: GoogleFonts.nunito(
                      color: Colors.red,
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
                              Icons.security,
                              size: 25,
                              color: Colors.black12,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Security Portal",
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
                            left: 20, top: 5, bottom: 5, right: 20),
                        child: Row(
                          children: [
                            Text(
                              "* This is only for admin.",
                              style: GoogleFonts.nunito(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          controller: _pcontroller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(width: 2, color: color.appbar),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: 'Enter Security Passcode',
                            labelStyle: TextStyle(color: color.appbar),
                            hintText: '1234',
                          ),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                            print("Password : " + password);
                          },
                          validator: (String? value) {
                            if (value!.length < 1) {
                              return 'you should not make price empty';
                            } else {
                              password = value;
                            }
                          },
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
                                  shape: StadiumBorder(), primary: Colors.red),
                              onPressed: () async {
                                checkAdmin();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Confirm",
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
      ),
    );
  }
}
