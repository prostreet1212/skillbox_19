import 'package:flutter/material.dart';
import 'package:project1/service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _service=PlatformService();
  var _counter=0;

  void getValue() async{
    _counter=await _service.callMethodChanel();
    setState(() {
      //_counter++;
    });
  }

  void getStream() async{
    _service.callEventChannel().listen((event) {
      setState(() {
        _counter=event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('число с андроид платформы'),
            Text(_counter.toString())
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: getStream,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}