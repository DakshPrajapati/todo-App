import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class uploadMain extends StatefulWidget {
  @override
  _uploadMainState createState() => _uploadMainState();
}

class _uploadMainState extends State<uploadMain> {
  Color blue = Color(0xff288C9A);
  TextEditingController title = TextEditingController();
  TextEditingController time = TextEditingController();

  final firestoreinstance = Firestore.instance;
  finalupload() {
    var data = {
      "title": title.text,
      "time": time.text,
    };
    firestoreinstance.collection("Tasks").document().setData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_sharp),
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {});
          finalupload();
          title.clear();
          time.clear();
        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.white,
        title: Text("ADD TASKS",
            style: GoogleFonts.oswald(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500)),
        backgroundColor: blue,
      ),
      backgroundColor: blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Task",
                style: GoogleFonts.oswald(fontSize: 24),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: title,
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  hintText: 'Eg. Doing Internship Task',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                maxLines: 5,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Time",
                style: GoogleFonts.oswald(fontSize: 24),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: time,
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  hintText: '11:50',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
