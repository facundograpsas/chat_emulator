
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState>{

  List<String> _chatList = [];
  List<String> _fullList = [];

  var index = 0;
  var fileText;


  ChatCubit()  : super(ChatInitial());

  void loadChat() async{
    fileText = await rootBundle.loadString('assets/peternum.txt');
    _fullList = LineSplitter.split(fileText).toList();
    startChat();
  }

  void startChat() async {
    // emit(ChatStarting2(_chatList));
    await Future.delayed(Duration(seconds: 2));
    _chatList.add(_fullList.elementAt(index));
    index++;
    if(_chatList.length<10){
      emit(ChatStarting(_chatList));
      startChat();
    }
  }

  @override
  void onChange(Change<ChatState> change) {
    // TODO: implement onChange
    print(change.toString());
    super.onChange(change);
  }


}