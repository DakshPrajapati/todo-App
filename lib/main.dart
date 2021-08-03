import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_task/upload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        backgroundColor: Color(0xff000000),
        body: homeScreen(),
      ),
    );
  }
}

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  Future getdata() async {
    QuerySnapshot qn = await Firestore.instance
        .collection('Tasks')
        .orderBy('time')
        .getDocuments();
    return qn.documents;
  }

  bool clicked = false;
  Color blue = Color(0xff288C9A);
  String day = DateFormat('EEEE').format(DateTime.now());
  List<bool> tap = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String date = DateFormat('d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding:
          const EdgeInsets.only(left: 20.0, top: 20, right: 20, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "TODAY",
                style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w500, color: blue, fontSize: 42),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 2,
                color: Colors.white,
              )),
              IconButton(
                  splashColor: blue,
                  icon: Icon(
                    Icons.refresh,
                    color: blue,
                  ),
                  onPressed: () {
                    setState(() {});
                  })
            ],
          ),
          Row(
            children: [
              Text(
                day,
                style: GoogleFonts.oswald(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                width: 15,
              ),
              Text(date,
                  style: GoogleFonts.oswald(color: Colors.white, fontSize: 15)),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [
                      0,
                      0.3,
                    ],
                    colors: <Color>[Colors.transparent, Colors.black],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstATop,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return;
                    },
                    child: FutureBuilder(
                        future: getdata(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: AnimatedDefaultTextStyle(
                                          child: Text(snapshot
                                              .data[index].data["time"]),
                                          style: tap[index]
                                              ? GoogleFonts.oswald(
                                                  color: blue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)
                                              : GoogleFonts.oswald(
                                                  decorationColor: Colors.blue,
                                                  color: blue,
                                                  //decoration: TextDecoration.lineThrough,
                                                  decorationThickness: 1.5,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onDoubleTap: () {
                                          setState(() {
                                            tap[index] = !tap[index];
                                          });
                                        },
                                        child: AnimatedDefaultTextStyle(
                                          child: Text(
                                            snapshot.data[index].data["title"],
                                          ),
                                          style: tap[index]
                                              ? GoogleFonts.oswald(
                                                  decorationColor: blue,
                                                  color: Colors.white70,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationThickness: 1.5,
                                                  fontSize: 28)
                                              : GoogleFonts.oswald(
                                                  color: Colors.white,
                                                  fontSize: 33),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: AnimatedDefaultTextStyle(
                                          child: Text(snapshot
                                              .data[index].data["time"]),
                                          style: tap[index]
                                              ? GoogleFonts.oswald(
                                                  color: blue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)
                                              : GoogleFonts.oswald(
                                                  decorationColor: Colors.blue,
                                                  color: blue,
                                                  //decoration: TextDecoration.lineThrough,
                                                  decorationThickness: 1.5,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onDoubleTap: () {
                                          setState(() {
                                            tap[index] = !tap[index];
                                          });
                                        },
                                        child: AnimatedDefaultTextStyle(
                                          child: Text(
                                            snapshot.data[index].data["title"],
                                          ),
                                          style: tap[index]
                                              ? GoogleFonts.oswald(
                                                  decorationColor: blue,
                                                  color: Colors.white70,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationThickness: 1.5,
                                                  fontSize: 28)
                                              : GoogleFonts.oswald(
                                                  color: Colors.white,
                                                  fontSize: 33),
                                          duration:
                                              const Duration(milliseconds: 200),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        }),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                height: 3,
                color: Colors.white,
              )),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => uploadMain()));
                },
                child: Text(
                  "ADD",
                  style: GoogleFonts.oswald(
                      color: blue, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
