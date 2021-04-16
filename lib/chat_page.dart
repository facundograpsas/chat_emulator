import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_view.dart';
import 'package:opinologos_eternum/widgets/chat_appbar.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {

  Color barColor = Color(0xFF025044);

  String bg = "whatsappwebbg.jpg";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: ChatAppBar(),
          backgroundColor:barColor,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$bg'),
                fit: BoxFit.cover
              )
            ),
            child: ChatView()),
      ),
    );
  }
}



