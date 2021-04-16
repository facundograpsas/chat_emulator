import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Message{

  final String sender;
  final String message;
  bool firstMessage;
  late Color color;

  Message({required this.sender, required this.message}) : firstMessage = true {


    switch(sender) {
      case "Juanfra": {
        color = Colors.blue;
      }
      break;

      case "Juli": {
        color = Colors.orange;
      }
      break;
      case "Gonza": {
        color = Colors.green;
      }
      break;
      case "Santi": {
        color = Colors.brown;
      }
      break;
      case "Nahue": {
        color = Colors.purple;
      }
      break;
      case "Tomi": {
        color = Colors.red;
      }
      break;
      case "Pablito": {
        color = Colors.greenAccent;
      }
      break;
      case "Lalo": {
        color = Colors.deepPurpleAccent;
      }
      break;
      case "Facu": {
        color = Colors.cyan;
      }
      break;
      case "Mati": {
        color = Colors.lightGreen;
      }
      break;
      case "Juani": {
        color = Colors.redAccent;
      }
      break;
      case "Pelle": {
        color = Colors.brown;
      }
      break;
      default: {
        color = Colors.pink;
      }
    }

  }


}