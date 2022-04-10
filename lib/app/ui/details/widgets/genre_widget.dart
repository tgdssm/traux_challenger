import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreWidget extends StatefulWidget {
  final String genre;
  const GenreWidget({Key? key, required this.genre}) : super(key: key);

  @override
  _GenreWidgetState createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15), color: const Color(0xffF5F5F5),),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(widget.genre, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
    );
  }
}
