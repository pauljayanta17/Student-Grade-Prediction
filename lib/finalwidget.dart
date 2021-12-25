import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_grade_predection/welcomepage.dart';
import 'api.dart';
import 'constanst.dart';

class TotalMarksContainer extends StatefulWidget {
  const TotalMarksContainer({Key? key}) : super(key: key);

  @override
  State<TotalMarksContainer> createState() => _TotalMarksContainerState();
}

class _TotalMarksContainerState extends State<TotalMarksContainer> {
  // String urll = "http://localhost:5000/api?prediction=1,1,4,4.6,4.78,4.8,4.6";
  @override
  void initState() {
    super.initState();
    GetData(Uri.parse(url)).then((value) {
      print(value);
      var obj = jsonDecode(value);
      double marks = obj['prediction'];
      finalMarks = marks.toStringAsPrecision(3).toString();
      print(finalMarks);
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Center(
      child: Column(
        children: [
          Text(
            "Predected 6th semester grade is",
            style: GoogleFonts.lato(
                fontSize: size.height * 0.04,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 2),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: finalMarks != null ? "$finalMarks    " : "",
                style: GoogleFonts.lato(
                    fontSize: size.height * 0.04,
                    fontWeight: FontWeight.w800,
                    color: Colors.orange),
              ),
              TextSpan(
                text: finalMarks != null ? "C.G.P.A. " : "",
                style: GoogleFonts.lato(
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.green),
              ),
            ])),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: TextButton(
                child: Container(
                    width: size.width * 0.2,
                    height: size.height * 0.1,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(29)),
                    child: Text("Predict another student grade",
                        style: GoogleFonts.ledger(
                            fontSize: size.height * 0.025,
                            color: Colors.white))),
                onPressed: () {
                  proceed = false;
                  fullname = "";
                  roll = "";
                  collegename = "";
                  error = "";
                  gender = null;
                  stream = null;
                  attendance = null;
                  studyhours = null;
                  finalMarks = "";
                  url = "http://localhost:5000/api?prediction=";
                  m1 = m2 = m3 = m4 = m5 = "";
                  setState(() {
                    print("marks $m2");
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (C) => WelcomePage()));
                }),
          ),
        ],
      ),
    ));
  }
}
