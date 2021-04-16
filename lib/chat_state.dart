import 'package:opinologos_eternum/message.dart';

abstract class ChatState {

  get chatList => [];
  List<Object> get props => [];

}
class ChatInitial extends ChatState{
}

class ChatSendingMessage extends ChatState{
 final List<Message> chatList;
 ChatSendingMessage(this.chatList);
}

class ChatWritingMessage extends ChatState{
  final List<Message> chatList;
  final String sender;
  ChatWritingMessage(this.chatList, this.sender);
  List<Object> get props => [sender, chatList];
}

class ChatNotWritingMessage extends ChatState{
  final List<Message> chatList;
  final String sender;
  ChatNotWritingMessage(this.chatList, this.sender);
  List<Object> get props => [sender, chatList];
}
