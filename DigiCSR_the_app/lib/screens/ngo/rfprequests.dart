import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RFPreq extends StatefulWidget {
  @override
  State<RFPreq> createState() => _RFPreqState();
}

class _RFPreqState extends State<RFPreq> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RFP',
          style:
              TextStyle(color: black, fontFamily: 'Montserrat', fontSize: 30),
        ),
        actions: [
          TextButton.icon(
              onPressed: () {},
              label: Text(
                'Notification',
                style: TextStyle(
                    color: black, fontFamily: 'Montserrat', fontSize: 17),
              ),
              icon: Icon(
                Icons.notifications,
                color: black,
              )),
          Container(
            // color: Colors.white,
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/app_icon/digicsr_app_icon.png'),
              backgroundColor: Colors.black,
              radius: 25,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Requests',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Montserrat',
                                fontSize: 25)),
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(10, 20, 10, 20)),
                            alignment: Alignment.center,
                            // elevation: MaterialStatePropertyAll(20),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: black,
                                        width: 1.2,
                                        style: BorderStyle.solid)))))),
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Respnses',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Montserrat',
                                fontSize: 25)),
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(10, 20, 10, 20)),
                            alignment: Alignment.center,
                            // elevation: MaterialStatePropertyAll(20),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: black,
                                        width: 1.2,
                                        style: BorderStyle.solid)))))),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    elevation: 20,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: black, width: 1.2, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                              child: Text('Company: Reliance'),
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: Text('Amount: 800000')),
                                Container(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: Text('Timeline: 20 months')),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  TextButton.icon(
                                    style: ButtonStyle(
                                      maximumSize: MaterialStatePropertyAll(Size(MediaQuery.sizeOf(context).width * 0.3, MediaQuery.sizeOf(context).height * 0.08)),
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                                      backgroundColor: MaterialStatePropertyAll(Colors.green)
                                    ),
                                      onPressed: () {},
                                      icon: Icon(Icons.done,color: black,),
                                      label: Text(
                                        'Accept',
                                        style: TextStyle(
                                            color: black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 20),
                                      )),
                                      Expanded(child: Container()),
                                  TextButton.icon(
                                    style: ButtonStyle(
                                      maximumSize: MaterialStatePropertyAll(Size(MediaQuery.sizeOf(context).width * 0.3, MediaQuery.sizeOf(context).height * 0.08)),
                                      padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                                      backgroundColor: MaterialStatePropertyAll(Colors.red)
                                    ),
                                      onPressed: () {},
                                      icon: Icon(Icons.close,color: black,),
                                      label: Text(
                                        'Reject',
                                        style: TextStyle(
                                            color: black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 20),
                                      )),
                                      Expanded(child: Container()),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}