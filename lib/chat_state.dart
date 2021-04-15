import 'package:opinologos_eternum/message.dart';

abstract class ChatState {


  // @override
  // // TODO: implement props
  // List<Object> get props => [];
  get chatList => [];

}

class ChatInitial extends ChatState{
}

class ChatSendingMessage extends ChatState{
 final List<Message> chatList;
 ChatSendingMessage(this.chatList);
}

class ChatSendingFirstMessage extends ChatState{
  final List<Message> chatList;
  ChatSendingFirstMessage(this.chatList);
}

class ChatWritingMessage extends ChatState{
  final List<Message> chatList;
  ChatWritingMessage(this.chatList);
}


class ChatStarting2 extends ChatState{
 final List<String> chatList;
 ChatStarting2(this.chatList);
}