import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_state.dart';

import 'package:flutter/foundation.dart' show kIsWeb;


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();


}

class _ChatPageState extends State<ChatPage> {

  String mBg = "whatsappbg.png";
  String webBg = "whatsapp_web_bg.jpg";
  String? bg;

  @override
  Widget build(BuildContext context) {
    if(kIsWeb) {
      bg = webBg;
    } else {
      bg = mBg;
    }
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opinologos 2.0"),
          // backgroundColor: Color(0xFF025044),
          backgroundColor: Colors.purple,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bg'),
                fit: BoxFit.cover
              )
            ),
            child: ChatView()),
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
                children: <Widget>[
                  for(final message in chats)
                      if(message.firstMessage)
                        FirstMessageBox(message: message)
                      else
                        MessageBox(message:message)
                ]),
          ),
          TextField()
        ],
      );}
    })
    ;
  }
}

class FirstMessageBox extends StatelessWidget {

  const FirstMessageBox({this.message,
    Key? key,
  }) : super(key: key);

  final message;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(
                color: Colors.grey,
                width: 0.3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3)
                  )
                ]
          ),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(message.sender,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: message.color
                        ),),
                      ),
                      Text(message.message),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MessageBox extends StatelessWidget {

  const MessageBox({this.message,
    Key? key,
  }) : super(key: key);

  final message;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(
                    color: Colors.grey,
                    width: 0.3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3)
                  )
                ]
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(message.message),
                      ),
                      // Text(message.message),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

