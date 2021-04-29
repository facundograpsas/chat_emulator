import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opinologos_eternum/chat_cubit.dart';
import 'package:opinologos_eternum/chat_state.dart';
class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit:BoxFit.cover,
                  image: AssetImage('assets/images/robot_icon.png')
              )
          )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1287GA"),
              BlocBuilder<ChatCubit, ChatState>(builder: (context, state)
              {
                if(state is ChatWritingMessage){
                  return Text("${state.sender} esta escribiendo un mensaje...",
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
    );
  }
}