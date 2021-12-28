// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_grade_predection/components/custom_text_field.dart';
import 'package:student_grade_predection/enter_marks.dart';
import 'constanst.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const String routename = '/welcomepage';
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color color = Colors.white;
  @override
  void initState() {
    super.initState();
    proceed = false;
    fullname = "";
    roll = "";
    collegename = "";
    error = "";
    gender_radio = null;
    stream_radio = null;
    attendance_radio = null;
    studyHoursWeekly_radio = null;
    gender = null;
    stream = null;
    attendance = null;
    studyhours = null;
    finalMarks = "";
    m1 = m2 = m3 = m4 = m5 = "";
    setState(() {
      print("marks $m2");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          // backgroundColor: Color.fromRGBO(93, 185, 83,1),
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
                      // color: Colors.green,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 0.25,
                          vertical: size.height * 0.05),

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
                            height: size.height * 0.04,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Student Details",
                                style: GoogleFonts.lato(
                                    fontSize: size.height * 0.035,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w800),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: size.width * 0.09),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.03,
                                              size.height * 0.14,
                                              0,
                                              0)),
                                      Text(
                                        "Name  :  ",
                                        style: GoogleFonts.lato(
                                            fontSize: size.height * 0.04,
                                            color: color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Padding(
                                      //     padding:
                                      //         EdgeInsets.only(left: size.width * 0.01)),
                                      text_field_container(
                                          size: size,
                                          field_height: 0.08,
                                          field_width: 0.2,
                                          hinttext: "Enter Full Name",
                                          onchange: (c) {
                                            fullname = c;
                                          },
                                          textsize: 0.024),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.026)),
                                      Text(
                                        "Roll No  :  ",
                                        style: GoogleFonts.lato(
                                            fontSize: size.height * 0.04,
                                            color: color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Padding(
                                      //     padding:
                                      //         EdgeInsets.only(left: size.width * 0.02)),
                                      text_field_container(
                                          size: size,
                                          field_height: 0.08,
                                          field_width: 0.14,
                                          onchange: (c) {
                                            roll = c;
                                          },
                                          hinttext: "Enter Roll No.",
                                          textsize: 0.024),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.03)),
                                      Text(
                                        "College Name  :  ",
                                        style: GoogleFonts.lato(
                                            fontSize: size.height * 0.04,
                                            color: color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Padding(
                                      //     padding:
                                      //         EdgeInsets.only(left: size.width * 0.01)),
                                      text_field_container(
                                          size: size,
                                          field_height: 0.08,
                                          field_width: 0.36,
                                          onchange: (c) {
                                            collegename = c;
                                            print(collegename);
                                          },
                                          hinttext: "Enter College Name",
                                          textsize: 0.024),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.03,
                                              size.height * 0.1,
                                              0,
                                              0)),
                                      Text(
                                        "Gender  :  ",
                                        style: GoogleFonts.lato(
                                            fontSize: size.height * 0.04,
                                            color: color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.08, 0, 0, 0)),
                                      GestureDetector(
                                        child: Text("Male",
                                            style: GoogleFonts.lato(
                                                fontSize: size.height * 0.02,
                                                color: color,
                                                fontWeight: FontWeight.bold)),
                                        onTap: () {
                                          setState(() {
                                            gender_radio = GenderOptions.Male;
                                            gender = "Male";
                                          });
                                        },
                                      ),
                                      Radio<GenderOptions>(
                                        value: GenderOptions.Male,
                                        groupValue: gender_radio,
                                        activeColor: Colors.lightGreen,
                                        onChanged: (GenderOptions? value) {
                                          setState(() {
                                            gender_radio = value;
                                            gender = "Male";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Text("Female",
                                            style: GoogleFonts.lato(
                                                fontSize: size.height * 0.02,
                                                color: color,
                                                fontWeight: FontWeight.bold)),
                                        onTap: () {
                                          setState(() {
                                            gender_radio = GenderOptions.Female;
                                            gender = "Female";
                                          });
                                        },
                                      ),
                                      Radio<GenderOptions>(
                                        value: GenderOptions.Female,
                                        groupValue: gender_radio,
                                        activeColor: Colors.lightGreen,
                                        onChanged: (GenderOptions? value) {
                                          setState(() {
                                            gender_radio = value;
                                            gender = "Female";
                                          });
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.08,
                                              size.height * 0.1,
                                              0,
                                              0)),
                                      Text(
                                        "Department  :  ",
                                        style: GoogleFonts.lato(
                                            color: color,
                                            fontSize: size.height * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.02, 0, 0, 0)),
                                      GestureDetector(
                                        child: Text("BCA",
                                            style: GoogleFonts.lato(
                                                fontSize: size.height * 0.02,
                                                color: color,
                                                fontWeight: FontWeight.bold)),
                                        onTap: () {
                                          setState(() {
                                            stream_radio = StreamOptions.BCA;
                                            stream = "BCA";
                                          });
                                        },
                                      ),
                                      Radio<StreamOptions>(
                                        value: StreamOptions.BCA,
                                        groupValue: stream_radio,
                                        activeColor: Colors.lightGreen,
                                        onChanged: (StreamOptions? value) {
                                          setState(() {
                                            stream_radio = value;
                                            stream = "BCA";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Text("BBA",
                                            style: GoogleFonts.lato(
                                                fontSize: size.height * 0.02,
                                                color: color,
                                                fontWeight: FontWeight.bold)),
                                        onTap: () {
                                          setState(() {
                                            stream_radio = StreamOptions.BBA;
                                            stream = "BBA";
                                          });
                                        },
                                      ),
                                      Radio<StreamOptions>(
                                        value: StreamOptions.BBA,
                                        groupValue: stream_radio,
                                        activeColor: Colors.lightGreen,
                                        onChanged: (StreamOptions? value) {
                                          setState(() {
                                            stream_radio = value;
                                            stream = "BBA";
                                          });
                                        },
                                      ),
                                    ],
                                  ),

                                  //Attendance
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.03,
                                              size.height * 0.05,
                                              0,
                                              0)),
                                      Text(
                                        "Attendance  :  ",
                                        style: GoogleFonts.lato(
                                            color: color,
                                            fontSize: size.height * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.034,
                                              size.height * 0.07,
                                              0,
                                              0)),
                                      GestureDetector(
                                        child: Text(
                                          "20%",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            attendance_radio = Attendance.One;
                                            attendance = "1";
                                          });
                                        },
                                      ),
                                      Radio<Attendance>(
                                        value: Attendance.One,
                                        groupValue: attendance_radio,
                                        activeColor: Colors.lightGreen,
                                        onChanged: (Attendance? value) {
                                          setState(() {
                                            attendance_radio = value;
                                            attendance = "1";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "40%",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            attendance_radio = Attendance.Two;
                                            attendance = "2";
                                          });
                                        },
                                      ),
                                      Radio<Attendance>(
                                        value: Attendance.Two,
                                        activeColor: Colors.lightGreen,
                                        groupValue: attendance_radio,
                                        onChanged: (Attendance? value) {
                                          setState(() {
                                            attendance_radio = value;
                                            attendance = "2";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "60%",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          attendance_radio = Attendance.Three;
                                          attendance = "3";
                                          setState(() {});
                                        },
                                      ),
                                      Radio<Attendance>(
                                        value: Attendance.Three,
                                        activeColor: Colors.lightGreen,
                                        groupValue: attendance_radio,
                                        onChanged: (Attendance? value) {
                                          setState(() {
                                            attendance_radio = value;
                                            attendance = "3";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "80%",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            attendance_radio = Attendance.Four;
                                            attendance = "4";
                                          });
                                        },
                                      ),
                                      Radio<Attendance>(
                                        value: Attendance.Four,
                                        activeColor: Colors.lightGreen,
                                        groupValue: attendance_radio,
                                        onChanged: (Attendance? value) {
                                          setState(() {
                                            attendance_radio = value;
                                            attendance = "4";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "100%",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            attendance_radio = Attendance.five;
                                            attendance = "5";
                                          });
                                        },
                                      ),
                                      Radio(
                                        value: Attendance.five,
                                        activeColor: Colors.lightGreen,
                                        groupValue: attendance_radio,
                                        onChanged: (Attendance? value) {
                                          setState(() {
                                            attendance_radio = value;
                                            attendance = "5";
                                          });
                                        },
                                      )
                                    ],
                                  ),

                                  // Study Hours Weekly
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.03,
                                              size.height * 0.07,
                                              0,
                                              0)),
                                      Text(
                                        "Study Hours Weekly  : ",
                                        style: GoogleFonts.lato(
                                            color: color,
                                            fontSize: size.height * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              size.width * 0.02,
                                              size.height * 0.07,
                                              0,
                                              0)),
                                      GestureDetector(
                                        child: Text(
                                          "Below   2  hrs",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            studyhours = "1";
                                            studyHoursWeekly_radio =
                                                StudyHoursWeekly.one;
                                          });
                                        },
                                      ),
                                      Radio<StudyHoursWeekly>(
                                        value: StudyHoursWeekly.one,
                                        groupValue: studyHoursWeekly_radio,
                                        activeColor: Colors.lightGreen,
                                        onChanged: (StudyHoursWeekly? value) {
                                          setState(() {
                                            studyHoursWeekly_radio = value;
                                            studyhours = "1";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "3  to  5 hrs",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            studyhours = "2";
                                            studyHoursWeekly_radio =
                                                StudyHoursWeekly.two;
                                          });
                                        },
                                      ),
                                      Radio<StudyHoursWeekly>(
                                        value: StudyHoursWeekly.two,
                                        activeColor: Colors.lightGreen,
                                        groupValue: studyHoursWeekly_radio,
                                        onChanged: (StudyHoursWeekly? value) {
                                          setState(() {
                                            studyHoursWeekly_radio = value;
                                            studyhours = "2";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "5  to  7 hrs",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            studyhours = "3";
                                            studyHoursWeekly_radio =
                                                StudyHoursWeekly.three;
                                          });
                                        },
                                      ),
                                      Radio<StudyHoursWeekly>(
                                        value: StudyHoursWeekly.three,
                                        activeColor: Colors.lightGreen,
                                        groupValue: studyHoursWeekly_radio,
                                        onChanged: (StudyHoursWeekly? value) {
                                          setState(() {
                                            studyHoursWeekly_radio = value;
                                            studyhours = "3";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "More than 10 hrs",
                                          style: GoogleFonts.lato(
                                              color: color,
                                              fontSize: size.height * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            studyHoursWeekly_radio =
                                                StudyHoursWeekly.four;
                                            studyhours = "4";
                                          });
                                        },
                                      ),
                                      Radio<StudyHoursWeekly>(
                                        value: StudyHoursWeekly.four,
                                        activeColor: Colors.lightGreen,
                                        groupValue: studyHoursWeekly_radio,
                                        onChanged: (StudyHoursWeekly? value) {
                                          setState(() {
                                            studyHoursWeekly_radio = value;
                                            studyhours = "4";
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.02)),
                          Text(
                            error,
                            style: GoogleFonts.roboto(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.044,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: TextButton(
                                child: Container(
                                    width: size.width * 0.18,
                                    height: size.height * 0.09,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius:
                                            BorderRadius.circular(29)),
                                    child: Text("Next",
                                        style: GoogleFonts.ledger(
                                            fontSize: size.height * 0.025,
                                            color: Colors.white))),
                                onPressed: () {
                                  setState(() {
                                    //Roll validation
                                    error = RollValidate(roll);
                                    print("Roll $error");
                                    //College name validation
                                    error = CollegeValidate(collegename);
                                    print("clg $error");
                                    //Name validation check
                                    error = fullNameValidate(fullname);
                                    print("fullname $error");
                                    if (error == "" &&
                                        gender?.length != null &&
                                        stream?.length != null &&
                                        attendance?.length != null &&
                                        studyhours?.length != null
                                        // roll.startsWith(RegExp(r'[A-Z][a-z]'))
                                        &&
                                        RegExp(r'[0-9]').hasMatch(roll)) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentMarks()));
                                    } else {
                                      error = "Enter Valid Input";
                                    }
                                  });
                                }),
                          ),
                        ],
                      ),
                    )
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

  String fullNameValidate(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.isEmpty || fullName == "") {
      return 'Error';
    }
    // else if(!fullname.contains(RegExp(r'^\\s+$'))){
    // return 'Error';

    // }
    else if (!regExp.hasMatch(fullName)) {
      return 'Error';
    }

    return '';
  }

  String CollegeValidate(String clgname) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (clgname.isEmpty || clgname == "") {
      return 'Error';
    } else if (!regExp.hasMatch(clgname)) {
      return 'Error';
    }
    return "";
  }

  String RollValidate(String r) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (r.isEmpty || r == "") {
      return 'Error';
    } else if (regExp.hasMatch(r)) {
      return 'Error';
    }
    return "";
  }
}
