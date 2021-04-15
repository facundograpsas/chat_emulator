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
        color = Colors.red;
      }
      break;

      case "Juli": {
        color = Colors.blue;
      }
      break;
      case "Gonza": {
        color = Colors.green;
      }
      break;
      case "Santi": {
        color = Colors.yellow;
      }
      break;
      case "Nahue": {
        color = Colors.purple;
      }
      break;
      case "Tomi": {
        color = Colors.brown;
      }
      break;
      case "Pablito": {
        color = Colors.orange;
      }
      break;
      default: {
        color = Colors.pink;
      }
    }

  }


}