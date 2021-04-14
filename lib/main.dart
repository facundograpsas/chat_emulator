import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opinologos_eternum/chat_page.dart';

void main() async {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}


class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileText;
  List<String> _list = [];
  List<String> _chatList = [];

  String _myLine;

  @override
  void initState() {
    loadList();
    super.initState();
    print("CHAU INIT");

  }

  void loadList() async {
    fileText = await rootBundle.loadString('assets/peternum.txt');
    setState(() {
      _list = LineSplitter.split(fileText).toList();
      print("blablafiesta");
      addLine(_list.first);
      _list.removeAt(0);
    });

  }

  void addLine(String string) async {
    await Future.delayed(Duration(seconds: 2));
    print("TERMINO EL FUTURE");
    setState(() {
      _chatList.add(string);
    });
  }

  @override
  Widget build(BuildContext context) {


    if(_chatList.isNotEmpty){
      addLine(_list.first);
      _list.removeAt(0);
    }

    return Scaffold(

      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: ListView(
                children:
                _chatList.map((e) =>
                   Text(e)).toList()
                ,
              ),
            ),
            TextField(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void getText(){

  }

}
