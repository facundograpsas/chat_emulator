import 'package:equatable/equatable.dart';

abstract class ChatState {


  // @override
  // // TODO: implement props
  // List<Object> get props => [];
  get chatList => [];

}

class ChatInitial extends ChatState{
}

class ChatSending extends ChatState{
 final List<String> chatList;
 ChatSending(this.chatList);

 // @override
 //  // TODO: implement props
 //  List<Object> get props => [chatList.length];
}


class ChatStarting2 extends ChatState{
 final List<String> chatList;
 ChatStarting2(this.chatList);
}