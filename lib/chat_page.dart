import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_state.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/foundation.dart' show kIsWeb;


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();


}

class _ChatPageState extends State<ChatPage> {

  Color barColor = Color(0xFF025044);

  String mBg = "whatsappbg.png";
  String asd = "whatsappwebbg.jpg";
  // String webBg = "whatsappwebbg.jpg";

  String? bg;

  @override
  Widget build(BuildContext context) {
    if(kIsWeb) {
      bg = asd;
    } else {
      bg = mBg;
    }
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opinologos 2.0"),
          // backgroundColor: Color(0xFF025044),
          backgroundColor:barColor,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$asd'),
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
          SizedBox(
            height: 20,
          ),
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
          margin: EdgeInsets.only(bottom: 5,left: 15,top: 3),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                color: Colors.grey,
                width: 0.6),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
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
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Text(message.sender,
                        style: GoogleFonts.mukta(
                            fontWeight: FontWeight.bold,
                            color: message.color
                        ),),
                      ),
                      Text(message.message,
                          style: GoogleFonts.mukta()),
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
          margin: EdgeInsets.only(bottom: 5,left: 15),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey,
                    width: 0.6),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
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
                        child: Text(message.message,
                        style: GoogleFonts.mukta()),
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

