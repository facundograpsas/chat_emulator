import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Message{

  final String sender;
  String message;
  bool firstMessage;
  late Color color;

  String? image;

  Message({required this.sender, required this.message, this.image}) : firstMessage = true {


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


   Future<int> getImage() async{
    if(message.contains("magen*")){
      // print("startsw");
      var req = await get(Uri.parse("https://meme-api.herokuapp.com/gimme/dankgentina"));
      if(req.statusCode==200){
        var imageMap = jsonDecode(req.body);
        image = imageMap["url"];
        message = "";
      }
    }
  return 1;
}




}