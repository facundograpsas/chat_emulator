
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_state.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/foundation.dart' show kIsWeb;
import 'widgets/custom_textfield.dart';
import 'widgets/first_message_box.dart';
import 'widgets/message_box.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();


}

class _ChatPageState extends State<ChatPage> {

  Color barColor = Color(0xFF025044);

  String mBg = "whatsappbg.png";
  String asd = "whatsappwebbg.jpg";
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

          title: Row(
            children: [Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage('assets/images/groupicture.jpg')
                )
            )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("el burro del grupo"),
                  BlocBuilder<ChatCubit, ChatState>(builder: (context, state)
            {
              if(state is ChatWritingMessage){
                return Text("${state.sender}BOT esta escribiendo un mensaje...",
                  style:TextStyle(
                      fontSize: 13,
                      color: Colors.grey
                  ),);
              }
              else{
                return Text("toca para info. del grupo",
                    style:TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                    ));
              }

            }
                  )
                ],
              ),
            ),
            ],
          ),
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
          Row(
            children: [
              Flexible(child: CircularRadiusShadowTextField()),
              IconButton(icon: Icon(Icons.send,
              color: Colors.white,), onPressed: (){})
            ],
          )
        ],
      );}
    })
    ;
  }
}




