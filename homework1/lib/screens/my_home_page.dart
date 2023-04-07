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
  final _service = PlatformService();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Введите текст',
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text('Отправить строку'),
                  onPressed: _controller.text.length > 0
                      ? () {
                          _service.callSetText(_controller.text);
                        }
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: AndroidView(
                    viewType: 'ANDROID_TEXTVIEW',
                    creationParamsCodec: const StandardMessageCodec(),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
