import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBox extends StatelessWidget {

  const MessageBox({this.message,
    Key? key, required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  final message;

  @override
  Widget build(BuildContext context) {
    // scrollController.jumpTo(scrollController.position.maxScrollExtent);
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5,left: 15),
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
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(message.message,
                            style: GoogleFonts.mukta()),
                      ),
                      // Text(message.message),
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