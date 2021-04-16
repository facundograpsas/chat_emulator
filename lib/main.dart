import 'package:flutter/material.dart';
import 'package:opinologos_eternum/chat_page.dart';

void main() async {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChatPage(),
    );
  }
}
