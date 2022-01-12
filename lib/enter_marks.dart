import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_grade_predection/constanst.dart';
import 'package:student_grade_predection/finalwidget.dart';
import 'components/custom_text_field.dart';

class StudentMarks extends StatefulWidget {
  const StudentMarks({Key? key}) : super(key: key);
  static const String routename = '/studentmarks';
  @override
  StudentMarksState createState() => StudentMarksState();
}

class StudentMarksState extends State<StudentMarks> {
  // String urll = "http://localhost:5000/api?prediction=1,1,4,4.6,4.78,4.8,4.6";
  Color color = Colors.white;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Setstate $url");
    // fullname="Jayanta Paul";
    // roll="2";
    // collegename="SVIMS";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("Height ${size.height}");
    print("Width ${size.width}");
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color.fromRGBO(62, 16, 115, 1),
          //   automaticallyImplyLeading: false,
          //   centerTitle: true,
          //   elevation: 10,
          //   title: Text(
          //     "Student Final / 6th Semester grade prediction",
          //     style: TextStyle(fontSize: size.height * 0.03),
          //   ),
          // ),
          body: size.width > 1160 || size.height > 647
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "images/background.jpg",
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black.withOpacity(0.5),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: size.height,
                      width: size.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 0.07,
                          vertical: size.height * 0.02),
                      child: Column(
                        children: [
                          Text(
                            "Student Final / 6th Semester grade prediction"
                                .toUpperCase(),
                            style: GoogleFonts.laila(
                                fontSize: size.height * 0.047,
                                color: Colors.white,
                                letterSpacing: 1.6),
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Hello,",
                                    style: GoogleFonts.lato(
                                        fontSize: size.height * 0.04,
                                        color: color,
                                        fontWeight: FontWeight.w800),
                                  )),
                              SizedBox(
                                width: size.height * 0.02,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    fullname,
                                    style: GoogleFonts.lato(
                                        color: color,
                                        fontSize: size.height * 0.04,
                                        fontWeight: FontWeight.w800),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Roll No.   :   $roll,   ",
                                    style: GoogleFonts.lato(
                                        color: color,
                                        fontSize: size.height * 0.035,
                                        fontWeight: FontWeight.w800),
                                  )),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Department    :    $collegename",
                                    style: GoogleFonts.lato(
                                        color: color,
                                        fontSize: size.height * 0.035,
                                        fontWeight: FontWeight.w800),
                                  )),
                              // SizedBox(
                              //   width: size.width * 0.02,
                              // ),
                            ],
                          ),

                          // SizedBox(
                          //   height: size.height * 0.01,
                          // ),

                          //Marks Widget Show here
                          proceed
                              ? showMarksText(context)
                              : marksWidget(context)
                          // showMarksText(context)
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      "Full size the screen",
                      style: GoogleFonts.lato(
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          letterSpacing: 2),
                    ),
                  ),
                )),
    );
  }

  Widget showMarksText(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      margin: EdgeInsets.only(top: size.height * 0.1),
      alignment: Alignment.bottomCenter,
      child: const Align(
          alignment: Alignment.bottomCenter, child: TotalMarksContainer()),
    );
  }

  Widget marksWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.67,
      width: size.width * 0.26,
      padding: EdgeInsets.all(size.height * 0.02),
      child: Column(
        children: [
          // 1st sem
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1st Semester CGPA",
                style: GoogleFonts.lato(
                    color: color,
                    fontSize: size.height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
              text_field_container(
                  size: size,
                  field_height: 0.08,
                  field_width: 0.08,
                  onchange: (c) {
                    m1 = c;
                  },
                  hinttext: "CGPA",
                  textsize: 0.024),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //2nd sem
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "2nd Semester CGPA",
                style: GoogleFonts.lato(
                    color: color,
                    fontSize: size.height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
              text_field_container(
                  size: size,
                  field_height: 0.08,
                  field_width: 0.08,
                  onchange: (c) {
                    m2 = c;
                  },
                  hinttext: "CGPA",
                  textsize: 0.024),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //3rd sem
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(padding: EdgeInsets.only(left: size.width * 0.03)),
              Text(
                "3rd Semester CGPA",
                style: GoogleFonts.lato(
                    color: color,
                    fontSize: size.height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
              text_field_container(
                  size: size,
                  field_height: 0.08,
                  field_width: 0.08,
                  onchange: (c) {
                    m3 = c;
                  },
                  hinttext: "CGPA",
                  textsize: 0.024),
            ],
          ),
          //4th sem
          SizedBox(
            height: 10,
          ),
          //3rd sem
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4th Semester CGPA",
                style: GoogleFonts.lato(
                    color: color,
                    fontSize: size.height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
              text_field_container(
                  size: size,
                  field_height: 0.08,
                  field_width: 0.08,
                  onchange: (c) {
                    m4 = c;
                  },
                  hinttext: "CGPA",
                  textsize: 0.024),
            ],
          ),

          //5th sem
          SizedBox(
            height: 10,
          ),
          //3rd sem
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "5th Semester CGPA",
                style: GoogleFonts.lato(
                    color: color,
                    fontSize: size.height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
              text_field_container(
                  size: size,
                  field_height: 0.08,
                  field_width: 0.08,
                  onchange: (c) {
                    m5 = c;
                  },
                  hinttext: "CGPA",
                  textsize: 0.024),
            ],
          ),

          Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
          Text(
            error,
            style: GoogleFonts.roboto(
                color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: TextButton(
                child: Container(
                    width: size.width * 0.15,
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(29)),
                    child: Text("Predict",
                        style: GoogleFonts.ledger(
                            fontSize: size.height * 0.025,
                            color: Colors.white))),
                onPressed: () async {
                  setState(() {
                    String patttern = r'^[a-z A-Z,.\-]+$';
                    if (isNumeric(m1) &&
                        isNumeric(m2) &&
                        isNumeric(m3) &&
                        isNumeric(m4) &&
                        isNumeric(m5) &&
                        double.parse(m1)>=2 &&
                        double.parse(m2)>=2 &&
                        double.parse(m3)>=2 &&
                        double.parse(m4)>=2 &&
                        double.parse(m5)>=2 &&
                        double.parse(m1)<=10 &&
                        double.parse(m2)<=10 &&
                        double.parse(m3)<=10 &&
                        double.parse(m4)<=10 &&
                        double.parse(m5)<=10
                        ) {
                      proceed = true;
                      url = url +
                          attendance! +
                          ',' +
                          studyhours! +
                          ',' +
                          m1 +
                          ',' +
                          m2 +
                          ',' +
                          m3 +
                          ',' +
                          m4 +
                          ',' +
                          m5;
                      print(url);
                      print(
                          m1 + " " + m2 + " " + m3 + " " + m4 + " " + m5 + " ");
                    } else {
                      print("Error");
                      error = "Enter valid marks";
                    }
                    // if (
                    //     // RegExp(r'^[0-9]$').hasMatch(m1) &&
                    //     // RegExp(r'^[0-9]$').hasMatch(m2) &&
                    //     // RegExp(r'^[0-9]$').hasMatch(m3) &&
                    //     // RegExp(r'^[0-9]$').hasMatch(m4) &&
                    //     // RegExp(r'^[0-9]$').hasMatch(m5) &&
                    //     RegExp("[0-9.-]").hasMatch(m1) &&
                    //         RegExp("[0-9.-]").hasMatch(m2) &&
                    //         RegExp("[0-9.-]").hasMatch(m3) &&
                    //         RegExp("[0-9.-]").hasMatch(m4) &&
                    //         RegExp("[0-9.-]").hasMatch(m5) &&
                    //         m1 != "" &&
                    //         m2 != "" &&
                    //         m3 != "" &&
                    //         m4 != "" &&
                    //         m5 != "" &&
                    //         double.parse(m1) <= 10 &&
                    //         double.parse(m1) > 0 &&
                    //         double.parse(m2) <= 10 &&
                    //         double.parse(m2) > 0 &&
                    //         double.parse(m3) <= 10 &&
                    //         double.parse(m3) > 0 &&
                    //         double.parse(m4) <= 10 &&
                    //         double.parse(m4) > 0 &&
                    //         double.parse(m5) <= 10 &&
                    //         double.parse(m5) > 0) {
                    //   proceed = true;
                    //   url = url +
                    //       attendance! +
                    //       ',' +
                    //       studyhours! +
                    //       ',' +
                    //       m1 +
                    //       ',' +
                    //       m2 +
                    //       ',' +
                    //       m3 +
                    //       ',' +
                    //       m4 +
                    //       ',' +
                    //       m5;
                    //   print(url);
                    //   print(
                    //       m1 + " " + m2 + " " + m3 + " " + m4 + " " + m5 + " ");
                    // } else {
                    //   print("Error");
                    //   error = "Enter valid marks";
                    // }
                  });
                }),
          ),
        ],
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
