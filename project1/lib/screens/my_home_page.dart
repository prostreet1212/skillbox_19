import 'package:flutter/material.dart';
import 'package:project1/platform_widget.dart';
import 'package:project1/service.dart';
import 'package:project1/web/web_service.dart';

import '../web/platform_view_web.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _service=PlatformServiceImpl();
  var _counter=0;

  void getValue() async{
    //_counter=await _service.callMethodChanel();
    _counter=_service.getValue();
    setState(() {
      //_counter++;
    });
  }

  void getStream() async{
    _service.getStream()/*callEventChannel()*/.listen((event) {
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
            Text(_counter.toString()),
            Container(
              color: Colors.green,
              child: PlatformWidget(hybridComposition: true,),
            ),
            StreamBuilder(
              stream: _service.getStream()/*callEventChannel()*/,
                builder: (context,snapshot){
                return Text('${snapshot.hasData?snapshot.data:'no data'}');
                })
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