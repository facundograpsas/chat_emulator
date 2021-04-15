
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
   Message? _lastMessage;



  ChatCubit()  : super(ChatInitial());

  void loadChat() async{
    _fileText = await rootBundle.loadString('assets/peternum.txt');
    _fullList = LineSplitter.split(_fileText).toList();
    _randomStart = Random().nextInt(_fullList.length-1);
    _index = _randomStart;
    sendMessage();
  }

  void sendMessage() async {
    var messageSplit = _fullList.elementAt(_index).split(": ");
    var message = Message(sender: messageSplit[0], message: messageSplit[1]);

    if(_chatList.isNotEmpty) {
      await messageTimeRandomizer(message.message);
      _lastMessage = _chatList.last;
      if(_chatList.last.sender==message.sender) message.firstMessage = false;
    }

    _chatList.add(message);
    _index++;
    emit(ChatSendingMessage(_chatList));
    sendMessage();
  }

  Future messageTimeRandomizer(String message) async {
    var messageLength = message.length;
    await Future.delayed(Duration(milliseconds: messageLength*100+Random().nextInt(3000)));
  }

  @override
  void onChange(Change<ChatState> change) {
    // TODO: implement onChange
    print(change.toString());
    super.onChange(change);
  }

  }
