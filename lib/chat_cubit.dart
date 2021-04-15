
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState>{

  List<String> _chatList = [];
  List<String> _fullList = [];

  var randomStart;
  var fileText;
  var random;
  var index;



  ChatCubit()  : super(ChatInitial());

  void loadChat() async{
    fileText = await rootBundle.loadString('assets/peternum.txt');
    _fullList = LineSplitter.split(fileText).toList();
    randomStart = Random().nextInt(_fullList.length-1);
    index = randomStart;
    getMessage();
  }

  void getMessage() async {
    // emit(ChatStarting2(_chatList));
    var message = _fullList.elementAt(index);
    await messageTimeRandomizer(message);
    _chatList.add(message);
    index++;
    emit(ChatSending(_chatList));
    getMessage();
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