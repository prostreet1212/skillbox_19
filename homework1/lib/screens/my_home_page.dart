import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late TextEditingController _controller;
  final _service=PlatformService();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = 'ANDROID_TEXTVIEW';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller:_controller ,
              ),
              ElevatedButton(
                child: Text('Отправить строку'),
                onPressed: () {
                  var method =MethodChannel('plugins.kurun.views/textview_1');
                   method.invokeMethod('setText', _controller.text);


                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: AndroidView(
                  viewType: 'plugins.kurun.views/textview',
                  //layoutDirection: TextDirection.ltr,
                  //creationParams: creationParams,
                  creationParamsCodec: const StandardMessageCodec(),
                ),
              )
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
