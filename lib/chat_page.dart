import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_state.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opinologos 2.0"),
        ),
        body: ChatView(),
      ),
    );
  }
}

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
      var chats = state.chatList as List<dynamic>;
      if(state is ChatInitial){
        context.read<ChatCubit>().loadChat();
        return Center(child: CircularProgressIndicator());
      }
        else{
      return Column(
        children: [
          Flexible(
              child: ListView(
            children: chats.map((e) =>
            Text(e)).toList(),
          )),
          TextField()
        ],
      );}
    })
    ;
  }
}
