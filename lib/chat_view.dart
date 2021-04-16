import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_state.dart';
import 'package:opinologos_eternum/widgets/custom_textfield.dart';
import 'package:opinologos_eternum/widgets/first_message_box.dart';
import 'package:opinologos_eternum/widgets/message_box.dart';



class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}
class _ChatViewState extends State<ChatView> {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
      var chats = state.chatList as List<dynamic>;
      if(state is ChatInitial){
        context.read<ChatCubit>().loadChat();
        return Center(child: CircularProgressIndicator());
      }
      else{
        if(_scrollController.hasClients){
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    for(final message in chats)
                      if(message.firstMessage)
                        FirstMessageBox(message: message)
                      else
                        MessageBox(message:message)

                  ]
              ),
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

