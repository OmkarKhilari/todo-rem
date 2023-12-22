import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListComponent extends StatefulWidget {
  const ListComponent({
    required this.toDoTask,
    super.key
    });

    final String toDoTask;
  
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 16,right: 16),
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
              color: !checked ? const Color(0xff4B33A9) : const Color(0xff4B33A9).withOpacity(0.6), 
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(width: 0.8, color: const Color(0xffBABABA).withOpacity(0.7)),
                  ),
                  child: checked ? const Icon(Icons.check, color: Color(0xffFFFFFF),) : null,
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                widget.toDoTask,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffFFFFFF),
                  letterSpacing: -0.2,
                  decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
                  fontStyle: checked ? FontStyle.italic : FontStyle.normal
                )
              )
            ],
          ),    
        ),
      ),
    );
  }
}
