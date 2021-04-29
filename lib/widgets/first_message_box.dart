import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstMessageBox extends StatelessWidget {


  const FirstMessageBox({this.message,
    Key? key
  }) : super(key: key);

  final message;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5,left: 15,top: 3),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey,
                    width: 0.6),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0,3)
                  )
                ]
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Text(message.sender,
                          style: GoogleFonts.mukta(
                              fontWeight: FontWeight.bold,
                              color: message.color
                          ),),
                      ),
                      Text(message.message,
                          style: GoogleFonts.mukta()),
                      if(message.image!=null) Container(
                          width:300,
                          height: 300,
                          child: Image.network(message.image))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
