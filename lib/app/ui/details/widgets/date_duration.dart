import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateDuration extends StatelessWidget {
  final String label;
  final String data;
  final bool expanded;
  const DateDuration({Key? key, required this.label, required this.data, this.expanded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey.withOpacity(.2)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),),
          if(expanded)
            Expanded(child: Text(data, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis,)),
          if(!expanded)
            Text(data, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
