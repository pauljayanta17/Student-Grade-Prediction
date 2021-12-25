enum GenderOptions { Male, Female }
enum StreamOptions {BCA,BBA}
enum Attendance {One,Two,Three,Four,five}
enum StudyHoursWeekly {one,two,three,four}
String ?gender;
String ?stream;
String ?attendance;
String ?studyhours;
String fullname="";
String roll="";
String collegename="";
String error="";
GenderOptions? gender_radio;
StreamOptions? stream_radio;
Attendance? attendance_radio;
StudyHoursWeekly? studyHoursWeekly_radio;

String m1="";
String m2="";
String m3="";
String m4="";
String m5="";

bool proceed=false;
String ?finalMarks;
var data;
String url='http://localhost:5000/api?prediction=';
