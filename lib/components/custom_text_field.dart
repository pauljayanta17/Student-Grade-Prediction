import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class text_field_container extends StatefulWidget {
  const text_field_container({
    Key? key,
    required this.size,required this.field_height,required this.field_width,required this.hinttext, required this.textsize,required this.onchange,
  }) : super(key: key);

  final Size size;
  final double field_height;
  final double field_width;
  final String hinttext;
  final double textsize;
  final Function onchange;

  @override
  State<text_field_container> createState() => _text_field_containerState();
}

class _text_field_containerState extends State<text_field_container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * widget.field_height,
      width: widget.size.width * widget.field_width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white
        ),
          // border: Border.all(),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        onChanged: (c){
          widget.onchange(c);
        },
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.4
        ),
          decoration: InputDecoration(
              hintText: widget.hinttext,
              hintStyle:GoogleFonts.lato(fontSize: widget.size.height * widget.textsize,color: Colors.white),
              border: OutlineInputBorder(
                
                  borderRadius: BorderRadius.circular(10)))),
    );
  }
}
