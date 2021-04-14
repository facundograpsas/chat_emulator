import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opinologos 2.0"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                Text("asda"),
                Text("asda"),
                Text("asda")
              ],
            ),
          ),
          TextField()
        ],
      ),
    );
  }
}
