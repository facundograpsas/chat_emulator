import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CircularRadiusShadowTextField extends StatelessWidget {
  const CircularRadiusShadowTextField() : super();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:3.0, horizontal: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(width: 0),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Escribe un mensaje aqui",
            ),
          ),
        ),
      ),
    );
  }
}
