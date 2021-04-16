
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/message.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState>{

  List<Message> _chatList = [];
  List<String> _fullList = [];

  late int _randomStart;
  late String _fileText;
  late int _index;



  ChatCubit()  : super(ChatInitial());

  void loadChat() async{
    _fileText = await rootBundle.loadString('assets/peternum.txt');
    _fullList = LineSplitter.split(_fileText).toList();
    _randomStart = Random().nextInt(_fullList.length-1);
    _index = _randomStart;
    sendMessage();
  }

  Message stringSplitToMessage(_index){
    print(_index);
    var messageSplit = _fullList.elementAt(_index).split(": ");
    return Message(sender: messageSplit[0], message: messageSplit[1]);
  }

  Future<Message> getMessage () async {
    var message =  stringSplitToMessage(_index);
    List<Message> messageList = [stringSplitToMessage(_index),stringSplitToMessage(_index+1),stringSplitToMessage(_index+2)];
    await writingMessage(messageList, message);
    return message;
  }

  void sendMessage() async {
    var message = await getMessage();
    _chatList.add(message);
    _index++;
    emit(ChatSendingMessage(_chatList));
    await Future.delayed(Duration(milliseconds: 500));
    sendMessage();
  }


  Future writingMessage(List<Message> messageList, Message currentMessage) async {
    if(_chatList.isNotEmpty) {
      for(int i = 0 ; i<3; i++){
        var randomWait = Random().nextInt(1000);
        if(Random().nextInt(2) == 0){
          emit(ChatWritingMessage(_chatList,messageList[Random().nextInt(messageList.length)].sender));
          await Future.delayed(Duration(milliseconds:Random().nextInt(randomWait)+(currentMessage.message.length*50)));
        }
        else{
          emit(ChatNotWritingMessage(_chatList,messageList[Random().nextInt(messageList.length)].sender));
          await Future.delayed(Duration(milliseconds:Random().nextInt(randomWait)));
        }
        emit(ChatWritingMessage(_chatList,messageList[Random().nextInt(messageList.length)].sender));
        await Future.delayed(Duration(milliseconds:Random().nextInt(500)));
      }
      if(_chatList.last.sender==currentMessage.sender) currentMessage.firstMessage = false;
    }
  }


  @override
  void onChange(Change<ChatState> change) {
    // TODO: implement onChange
    // print(change.toString());
    super.onChange(change);
  }

  }
