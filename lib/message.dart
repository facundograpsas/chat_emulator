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
      case "BOT1": {
        color = Colors.blue;
      }
      break;

      case "BOT2": {
        color = Colors.orange;
      }
      break;
      case "BOT3": {
        color = Colors.green;
      }
      break;
      case "BOT4": {
        color = Colors.brown;
      }
      break;
      case "BOT5": {
        color = Colors.purple;
      }
      break;
      case "BOT6": {
        color = Colors.red;
      }
      break;
      case "BOT7": {
        color = Colors.greenAccent;
      }
      break;
      case "BOT8": {
        color = Colors.deepPurpleAccent;
      }
      break;
      case "BOT9": {
        color = Colors.cyan;
      }
      break;
      case "BOT10": {
        color = Colors.lightGreen;
      }
      break;
      case "BOT11": {
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