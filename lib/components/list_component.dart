import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListComponent extends StatefulWidget {
  const ListComponent({super.key});
  
  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 60,
        width: width * 0.85,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         colors: [Color(0xff4b33a9)],
        //         tileMode: TileMode.clamp)),
        decoration: BoxDecoration(
            color: Color(0xff4B33A9), 
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(width: 0.8, color: Color(0xffBABABA).withOpacity(0.7)),
                ),
                child: checked ? Icon(Icons.check_sharp, color: Color(0xffFFFFFF),) : null,
              ),
            ),
            SizedBox(width: 20,),
            Text(
              'Task 1',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color(0xffFFFFFF),
                letterSpacing: -0.2,
                decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
                fontStyle: checked ? FontStyle.italic : FontStyle.normal
              )
            )
          ],
        ),    
      ),
    );
  }
}
