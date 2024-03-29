import 'dart:convert';

import 'package:digicsr/screens/Homescreen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/constants.dart';

class NGOSignUp extends StatefulWidget {
  @override
  State<NGOSignUp> createState() {
    return _NGOSignUp();
  }
}

class _NGOSignUp extends State<NGOSignUp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    btn = 'SignUp';
    otp = '';
    otpverify = false;
    otpcontroller = OtpFieldController();
    otpsent = false;
  }

  OtpFieldController otpcontroller = OtpFieldController();
  String otp = '';
  bool otpverify = false;    

  bool otpsent = false;

  // TextButton btn = TextButton(onPressed: (){}, child: );

  void sendOTP() async {
    try {
      var resSend = await http.post(Uri.parse(ipInfo + '/ngo/signup'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'csr': ngo.csr,
            'email': ngo.email
          });
      print(resSend.body);
      otpsent = true;
    } catch (e) {
      print(e);
    }
  }

  void verifyOTP() async {
    try {
      final res = await http.post(Uri.parse(ipInfo + '/ngo/verify'),
          headers: <String, String>{
            'Context-Type': 'application/json;charSet=UTF-8'
          },
          body: {
            'csr': ngo.csr,
            'email': ngo.email,
            'otp': otp
          });
          print(res.body);
      if(res.statusCode == 200){
        otpverify = true;
        
      btn = 'SignUP';
      await storage.write(key: "ngo", value: jsonDecode(res.body)['result']);
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                elevation: 30,
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.03,
            top: MediaQuery.of(context).size.height * 0.18,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                side: BorderSide(
                    width: 1.5,
                    style: BorderStyle.solid,
                    strokeAlign: 3,
                    color: Colors.transparent),
              ),
              elevation: 40,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Container(
                      // padding: const EdgeInsets.all(15.0),
                      padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top * 0.3),
                      child: Text(
                        'SignUp as $user',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 28,
                          color: primary,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.04,top: MediaQuery.sizeOf(context).width * 0.04),
                            // padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top * 0.5,left: MediaQuery.paddingOf(context).left * 0.4),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          color: primary),
                                    )),
                                TextFormField(
                                  controller:
                                      TextEditingController(text: ngo.email),
                                  onChanged: (value) {
                                    ngo.email = value;
                                  },
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter email';
                                    } else if (RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'Enter valid email';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 15, bottom: 15, left: 10),
                                    // label: Text(
                                    //   'Email',
                                    //   style: TextStyle(
                                    //       color: darkgrey,
                                    //       fontFamily: 'Montserrat',
                                    //       fontWeight: FontWeight.w800),
                                    // ),
                                    hintText: 'ex. digicsr@gmail.com',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // margin: const EdgeInsets.only(
                            //     left: 8, right: 8, top: 5, bottom: 5),
                            // padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 8, 5, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'CSR',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          color: primary),
                                    )),
                                TextFormField(
                                  // scrollPadding: EdgeInsets.all(5),
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                  controller:
                                      TextEditingController(text: ngo.csr),
                                  onChanged: (value) {
                                    ngo.csr = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter CSR';
                                    } else {
                                      return 'Invalid CSR';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 15, bottom: 15, left: 10),
                                    // label: Text(
                                    //   'CSR',
                                    //   style: TextStyle(
                                    //       color: darkgrey,
                                    //       fontFamily: 'Montserrat',
                                    //       fontWeight: FontWeight.w800),
                                    // ),
                                    hintText: 'Enter CSR here',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: primary)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top * 0.6,
                          bottom: MediaQuery.paddingOf(context).top * 0.3),
                      child: OTPTextField(
                        width: MediaQuery.of(context).size.width * 0.8,
                        controller: otpcontroller,
                        length: 6,
                        contentPadding: EdgeInsets.all(8.0),
                        onChanged: (value) => {otp = value},
                        onCompleted: (value) => {
                          otp = value,
                          print(otp),
                          verifyOTP(),
                          print("truedefrgt.................................................."),
                          setState((){})},
                        // spaceBetween: 2,
                        outlineBorderRadius: 6,
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                        spaceBetween: 10, fieldWidth: 35,
                        textFieldAlignment: MainAxisAlignment.center,
                        fieldStyle: FieldStyle.box,
                        otpFieldStyle: OtpFieldStyle(
                            borderColor: Colors.blue,
                            focusBorderColor: Colors.blue,
                            errorBorderColor: Colors.red,
                            enabledBorderColor: Colors.blue),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.paddingOf(context).top * 0.4,
                          top: MediaQuery.paddingOf(context).top * 0.2),
                      child: Row(
                        children: [
                          Checkbox(
                            value: otpverify, onChanged: (value) {},
                            activeColor: primary,
                            fillColor: MaterialStatePropertyAll(white),
                            checkColor: primary,
                            // focusColor: grey,
                            // hoverColor: grey,
                            // splashRadius: 9,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                            // splashRadius: 12,
                          ),
                          Text(
                            'OTP verified',
                            style: TextStyle(
                                color: primary,
                                fontFamily: 'Montserrat',
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: TextButton(
                            style: ButtonStyle(
                                elevation: MaterialStatePropertyAll(20),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(
                                        MediaQuery.paddingOf(context).top *
                                            0.3)),
                                backgroundColor:
                                    MaterialStatePropertyAll(primary),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.transparent,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))))),
                            onPressed: () {
                              // (btn == 'Send OTP')
                              //     ? sendOTP()
                              //     : Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 Login_Screen()));
                              if (!otpverify) {
                                sendOTP();
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen()));
                              }
                            },
                            child: Text(
                              btn,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
